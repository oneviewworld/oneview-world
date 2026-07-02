# OneView

**Building Mobile Apps, Games & Digital Solutions**

OneView helps startups, enterprises and growing businesses design, build and scale mobile applications, enterprise software, backend systems, games and digital experiences.

## 🌐 Live Site

[https://oneview.world](https://oneview.world)

## Tech Stack

- **Framework:** Flutter Web
- **Language:** Dart
- **Fonts:** Google Fonts (Inter)
- **Animations:** Custom painters, scroll-triggered animations
- **Deployment:** GitHub Pages with GitHub Actions

## Development

```bash
# Get dependencies
flutter pub get

# Run locally
flutter run -d chrome

# Build for production
flutter build web --release --base-href "/"

# Analyze code
flutter analyze
```

## Deployment

The site automatically deploys to GitHub Pages via GitHub Actions on push to `main`.

### Custom Domain Configuration

The site is configured to serve at `oneview.world` with:
- CNAME file for GitHub Pages
- Proper DNS configuration (A records + CNAME)
- SSL via GitHub Pages

## Architecture

```
lib/
├── core/
│   ├── constants/    # App data, spacing, constants
│   ├── theme/        # Colors, typography, theme provider
│   └── utils/        # Responsive utilities
├── models/           # Data models
├── pages/            # Page widgets
├── sections/         # Homepage sections
└── widgets/
    ├── animations/   # Animation widgets
    └── common/       # Reusable components
```

## License

Copyright © 2026 OneView. All rights reserved.
