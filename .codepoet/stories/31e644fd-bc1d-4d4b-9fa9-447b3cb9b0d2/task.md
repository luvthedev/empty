# Task: Deliver 2-3 demo pages showing core product concept and user flow

## Description
Build 2-3 key pages that demonstrate the main user journey. Pages will include realistic data for primary features and generic placeholders for secondary sections, balancing speed with credibility.

## Acceptance Criteria
- Landing page displays hero section, feature highlights, and call-to-action
- Feature pages show realistic sample data and use-case descriptions
- Navigation menu is present on all pages and links work correctly
- Pages are responsive and readable on mobile, tablet, and desktop
- All pages contain valid HTML5 and pass basic accessibility checks

## Implementation Notes
- Create src/pages/index.md as landing page with hero section (title, tagline, call-to-action button), 2-3 feature highlights with realistic descriptions, and footer with contact placeholder.
- Create src/pages/feature-1.md and src/pages/feature-2.md as detail pages for the two main features, each with realistic use-case description, sample data table or list, and navigation back to home.
- Create src/data/sample-data.json containing 5-10 realistic sample records (e.g., user profiles, transactions, or items) relevant to the product concept; use this data in feature pages via template variables.
- Update src/layouts/base.html to include navigation menu linking to all pages and a footer with copyright and placeholder links.
- Create simple SVG placeholders (src/assets/images/placeholder-hero.svg and placeholder-feature.svg) for visual hierarchy; use in pages where images would appear in production.
- Add responsive CSS media queries to src/assets/css/style.css for mobile (< 768px), tablet (768px-1024px), and desktop (> 1024px) viewports.
- Ensure all pages are valid HTML5 and pass basic accessibility checks (alt text on images, semantic heading hierarchy, sufficient color contrast).

## When You're Done
When you have completed all acceptance criteria, create the file `.codepoet/stories/31e644fd-bc1d-4d4b-9fa9-447b3cb9b0d2/done.json` with this exact structure:
```json
{
  "status": "completed",
  "summary": "<brief summary of what you did>",
  "files_changed": ["list", "of", "files"]
}
```
IMPORTANT: The file MUST be at exactly `.codepoet/stories/31e644fd-bc1d-4d4b-9fa9-447b3cb9b0d2/done.json`.
Do NOT create this file until you are fully done.
Do NOT perform any git operations (no git add, commit, or push).