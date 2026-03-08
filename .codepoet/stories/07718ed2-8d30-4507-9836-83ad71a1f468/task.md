# Task: Make prototype accessible to stakeholders via password-protected URL

## Description
Deploy the static site to a staging environment with password protection, enabling stakeholders to access and review the prototype while keeping it secure and private.

## Acceptance Criteria
- Staging site is accessible only with correct username and password
- All pages and assets load correctly on staging
- Stakeholders can access the prototype via a single URL
- Deployment can be repeated quickly for updates
- Access instructions are documented and shared with stakeholders

## Implementation Notes
- Choose a hosting platform (e.g., Netlify, Vercel, GitHub Pages with authentication, or traditional web host) and create account with staging environment.
- Create .env.example documenting required environment variables (STAGING_URL, BASIC_AUTH_USER, BASIC_AUTH_PASS) without actual values; add .env to .gitignore.
- If using traditional web host, create src/.htaccess file with HTTP Basic Authentication directive (AuthType Basic, AuthName, require valid-user) to protect staging site.
- Create deploy.sh script that builds the project (npm run build), sets environment variables from .env file, and deploys build/ directory to staging environment using platform-specific CLI or FTP.
- Add deploy script to package.json as npm run deploy for easy execution.
- Create docs/STAGING_ACCESS.md with instructions for stakeholders: staging URL, username, password, and note that this is a prototype for feedback only.
- Test deployment by running npm run deploy and verifying the site is accessible at staging URL with correct password protection.

## When You're Done
When you have completed all acceptance criteria, create the file `.codepoet/stories/07718ed2-8d30-4507-9836-83ad71a1f468/done.json` with this exact structure:
```json
{
  "status": "completed",
  "summary": "<brief summary of what you did>",
  "files_changed": ["list", "of", "files"]
}
```
IMPORTANT: The file MUST be at exactly `.codepoet/stories/07718ed2-8d30-4507-9836-83ad71a1f468/done.json`.
Do NOT create this file until you are fully done.
Do NOT perform any git operations (no git add, commit, or push).