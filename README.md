# OneView

**Mobile apps, games and software — built and shipped for you**

You bring the idea; OneView designs it, builds it, and ships it to the App Store and Play Store — iOS, Android, web, and the backend behind them. Marketing site for founders and businesses looking to hire a team to build their product.

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
