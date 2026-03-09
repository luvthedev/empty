#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------------------
# deploy.sh - Build and deploy the staging site
# -------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Load environment variables from .env if present
if [ -f .env ]; then
  echo "Loading environment from .env ..."
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
else
  echo "ERROR: .env file not found."
  echo "Copy .env.example to .env and fill in your values."
  exit 1
fi

# Validate required variables
for var in STAGING_URL BASIC_AUTH_USER BASIC_AUTH_PASS DEPLOY_METHOD DEPLOY_TARGET; do
  if [ -z "${!var:-}" ]; then
    echo "ERROR: $var is not set in .env"
    exit 1
  fi
done

# -------------------------------------------------------
# Step 1: Generate .htpasswd from env credentials
# -------------------------------------------------------
echo "Generating .htpasswd ..."
HTPASSWD_FILE="$SCRIPT_DIR/build/.htpasswd"

# -------------------------------------------------------
# Step 2: Build the site
# -------------------------------------------------------
echo "Building site ..."
npm run build

# Create .htpasswd in build directory after build
# Uses openssl for portable password hashing
HASHED_PASS=$(openssl passwd -apr1 "$BASIC_AUTH_PASS")
echo "${BASIC_AUTH_USER}:${HASHED_PASS}" > "$HTPASSWD_FILE"

# Update .htaccess to point to the correct .htpasswd path
# For most shared hosts, use the absolute server path
if [ -f build/.htaccess ]; then
  case "$DEPLOY_TARGET" in
    *:*)
      # rsync/scp format - extract the path portion
      REMOTE_PATH="${DEPLOY_TARGET#*:}"
      ;;
    *)
      REMOTE_PATH="$DEPLOY_TARGET"
      ;;
  esac
  sed -i.bak "s|/path/to/.htpasswd|${REMOTE_PATH}/.htpasswd|g" build/.htaccess
  rm -f build/.htaccess.bak
fi

echo "Build complete. Output in build/"

# -------------------------------------------------------
# Step 3: Deploy
# -------------------------------------------------------
echo "Deploying via ${DEPLOY_METHOD} to ${DEPLOY_TARGET} ..."

case "$DEPLOY_METHOD" in
  rsync)
    rsync -avz --delete build/ "$DEPLOY_TARGET/"
    ;;
  scp)
    scp -r build/* "$DEPLOY_TARGET/"
    ;;
  ftp)
    echo "FTP deployment requires manual upload of build/ directory."
    echo "Consider using lftp or ncftp for scripted FTP uploads."
    exit 1
    ;;
  *)
    echo "ERROR: Unknown DEPLOY_METHOD: $DEPLOY_METHOD"
    echo "Supported methods: rsync, scp, ftp"
    exit 1
    ;;
esac

echo ""
echo "Deployment complete!"
echo "Staging URL: $STAGING_URL"
echo "Username:    $BASIC_AUTH_USER"
echo ""
