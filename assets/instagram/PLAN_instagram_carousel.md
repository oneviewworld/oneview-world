# Instagram Carousel — Implementation Plan

## Overview
Add an auto-rotating carousel section to oneview.world that showcases Instagram posts. Posts are stored locally (no API dependency). Clicking a post opens it on Instagram.

## Behavior
- Infinite horizontal auto-scroll (loops continuously)
- Pauses on mouse hover
- Resumes on mouse leave
- Each card is clickable → opens the Instagram post URL in a new tab
- Responsive: adapts to mobile/tablet/desktop

## Data Source
Manual. For each post, we need:
| Field | Required | Example |
|-------|----------|---------|
| Image file | Yes | `assets/instagram/post_01.jpg` |
| Post URL | Yes | `https://www.instagram.com/p/ABC123/` |
| Caption | Yes | "Building the future of mobile apps..." |
| Likes count | Optional | 42 |
| Date posted | Optional | 2026-08-10 |

## File Structure
```
lib/
  core/
    models/
      instagram_post.dart        ← data model
    data/
      instagram_posts_data.dart  ← list of posts
  sections/
    instagram_section.dart       ← section with header + carousel
  widgets/
    instagram/
      instagram_carousel.dart    ← auto-scroll logic
      instagram_card.dart        ← individual post card

assets/
  instagram/                     ← post images go here
    post_01.jpg
    post_02.jpg
    ...
```

## Implementation Steps

### Step 1 — Data Layer
- Create `InstagramPost` model (image path, url, caption, likes, date)
- Create `instagramPosts` list with placeholder data

### Step 2 — Assets
- User provides post images → drop into `assets/instagram/`
- Register folder in `pubspec.yaml`

### Step 3 — Carousel Widget
- `InstagramCarousel`: PageView or ListView with auto-scroll timer
- Timer interval: ~3 seconds per card
- On hover: cancel timer. On leave: restart timer
- Infinite scroll via modulo index trick

### Step 4 — Post Card Widget
- `InstagramCard`: Glass card showing image, caption preview, like count
- Instagram icon overlay or badge
- Hover effect (subtle scale/glow)
- `url_launcher` to open post on tap

### Step 5 — Section Integration
- `InstagramSection`: SectionHeader ("From Our Instagram") + carousel
- Insert into homepage between existing sections
- Match existing dark theme / glass card aesthetic

### Step 6 — Adding New Posts (future)
- Drop image in `assets/instagram/`
- Add entry to `instagram_posts_data.dart`
- Push to main → auto-deploys

## Design Direction
- Dark background consistent with rest of site
- Glass-morphism cards (matches existing `GlassCard` widget)
- Subtle gradient border on hover
- Instagram gradient accent on icon/badge
- Smooth scroll animation (ease-in-out)

## Waiting On
- [ ] Post images from user
- [ ] Post URLs from user
- [ ] Captions/likes from user
- [ ] Design sample (optional, user may provide)
