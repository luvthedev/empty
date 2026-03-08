#!/usr/bin/env bash
set -euo pipefail

#
# deploy.sh - Build and deploy the static site to staging
#
# Usage:
#   ./deploy.sh          # Build and deploy
#   ./deploy.sh build    # Build only (no deploy)
#
# Requires a .env file with deployment configuration.
# See .env.example for required variables.
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# --- Load environment variables ---
if [ ! -f .env ]; then
  echo "Error: .env file not found."
  echo "Copy .env.example to .env and fill in your deployment settings."
  exit 1
fi

# shellcheck source=/dev/null
source .env

# --- Validate required variables ---
required_vars=(STAGING_URL BASIC_AUTH_USER BASIC_AUTH_PASS DEPLOY_METHOD DEPLOY_HOST DEPLOY_PATH)
for var in "${required_vars[@]}"; do
  if [ -z "${!var:-}" ]; then
    echo "Error: $var is not set in .env"
    exit 1
  fi
done

# --- Generate .htpasswd ---
echo "Generating .htpasswd credentials..."
if command -v htpasswd &> /dev/null; then
  htpasswd -cb src/.htpasswd "$BASIC_AUTH_USER" "$BASIC_AUTH_PASS"
elif command -v openssl &> /dev/null; then
  HASHED=$(openssl passwd -apr1 "$BASIC_AUTH_PASS")
  echo "${BASIC_AUTH_USER}:${HASHED}" > src/.htpasswd
else
  echo "Error: Neither htpasswd nor openssl found. Install apache2-utils or openssl."
  exit 1
fi

# --- Build the site ---
echo "Building the site..."
npm run build

# Copy .htpasswd into build output
cp src/.htpasswd build/.htpasswd

# Update .htaccess to point to the correct .htpasswd path
if [ -f build/.htaccess ]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|/path/to/.htpasswd|${DEPLOY_PATH}/.htpasswd|g" build/.htaccess
  else
    sed -i "s|/path/to/.htpasswd|${DEPLOY_PATH}/.htpasswd|g" build/.htaccess
  fi
fi

echo "Build complete. Output in build/ directory."

# --- Deploy (unless build-only mode) ---
if [ "${1:-}" = "build" ]; then
  echo "Build-only mode. Skipping deployment."
  exit 0
fi

echo "Deploying to staging via ${DEPLOY_METHOD}..."

case "$DEPLOY_METHOD" in
  rsync)
    rsync -avz --delete build/ "${DEPLOY_HOST}:${DEPLOY_PATH}/"
    ;;
  scp)
    scp -r build/* "${DEPLOY_HOST}:${DEPLOY_PATH}/"
    ;;
  ftp)
    if command -v lftp &> /dev/null; then
      lftp -e "mirror -R --delete build/ ${DEPLOY_PATH}/; quit" "$DEPLOY_HOST"
    else
      echo "Error: lftp not found. Install lftp for FTP deployment."
      exit 1
    fi
    ;;
  *)
    echo "Error: Unknown DEPLOY_METHOD '${DEPLOY_METHOD}'. Use rsync, scp, or ftp."
    exit 1
    ;;
esac

echo ""
echo "Deployment complete!"
echo "Staging URL: ${STAGING_URL}"
echo "Username: ${BASIC_AUTH_USER}"
echo ""
echo "Share access details from docs/STAGING_ACCESS.md with stakeholders."
