# OneView

**Mobile apps, games and software — built and shipped for you**

You bring the idea; OneView designs it, builds it, and ships it to the App Store and Play Store — iOS, Android, web, and the backend behind them. Marketing site for founders and businesses looking to hire a team to build their product.

## 🌐 Live Site

[https://oneview.world](https://oneview.world)

## Tech Stack

- **Framework:** Astro (static site, in `astro-site/`)
- **Content:** Markdown project pages in `astro-site/src/content/projects/`
- **Deployment:** GitHub Pages via GitHub Actions

## Development

```bash
cd astro-site

# Install dependencies
npm ci

# Run locally (http://localhost:4321)
npm run dev

# Build for production (outputs to astro-site/dist)
npm run build
```

## Deployment

Work happens on `development`. The site deploys to GitHub Pages when `development` is merged into `deployment` and pushed (`.github/workflows/deploy.yml`).

### Custom Domain Configuration

The site is configured to serve at `oneview.world` with:
- CNAME file for GitHub Pages
- Proper DNS configuration (A records + CNAME)
- SSL via GitHub Pages

## Structure

```
astro-site/
├── public/           # Static files (images, favicon, robots.txt, sitemap.xml)
└── src/
    ├── components/   # Page sections and UI components
    ├── content/      # Project case studies (Markdown)
    ├── data/         # Site data
    ├── layouts/      # Page layouts
    ├── pages/        # Routes
    ├── scripts/      # Client-side scripts
    └── styles/       # Global styles
assets/               # Brand logos and Instagram material (not used by the site build)
```

## License

Copyright © 2026 OneView. All rights reserved.
