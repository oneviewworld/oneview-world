# Astro Migration Plan

## Why

The current site is built in Flutter Web, which renders all content to a GPU
canvas instead of real DOM text. Search engines (and AI answer engines like
ChatGPT/Perplexity) execute the JavaScript, wait for the app to load, and
still find nothing but `document.body.innerText === "Loading OneView..."`.
Confirmed via Google Search Console: **18 pages, 0 indexed, 0 search
clicks.** This blocks organic search as a lead channel entirely, regardless
of how good the copy is.

Fix: rebuild the site in **Astro**, a static-site framework that outputs
real HTML/CSS with zero JS by default (JS only where explicitly needed, e.g.
the contact form). Same GitHub Pages hosting, same custom domain, same
copy — only the rendering technology changes.

A parallel, faster path (Cloudflare + Prerender.io, serving crawlers a
prerendered snapshot while humans get the Flutter app) was scoped and
partially staged as a stopgap, but this migration fixes the root cause
instead of patching around it.

## Target stack

- **Astro** (astro.build) — static-site generator, HTML/CSS/vanilla JS
- **Markdown** content collections for blog posts (frontmatter + body)
- **GitHub Actions** → **GitHub Pages** — same deploy target as today,
  workflow just swaps `flutter build web` for `astro build`
- **EmailJS** + **reCAPTCHA v3** for the contact form — same services,
  reimplemented with their JS SDKs (both are plain `<script>`-based, so this
  is actually simpler than the current Flutter plugin bridge)

## Site structure (routes)

```
/                     → homepage
/projects             → project list
/projects/[slug]      → 8 project detail pages
/blog                 → blog list
/blog/[slug]          → 6 blog post pages
```

## Content source → destination map

| Current source (Flutter/Dart) | Destination (Astro) | Notes |
|---|---|---|
| `lib/core/constants/app_constants.dart` | `src/data/site.ts` or frontmatter constants | tagline, hero headline/description, about description, email, nav items |
| `lib/core/constants/app_data.dart` (`services`) | `src/data/services.ts` | 14 service cards — title, description, icon name, benefits[] |
| `app_data.dart` (`solutions`) | `src/data/solutions.ts` | 10 industry cards |
| `app_data.dart` (`processSteps`) | `src/data/process.ts` | 8 steps |
| `app_data.dart` (`whyOneView`) | `src/data/why.ts` | 8 reason cards |
| `app_data.dart` (`faqs`) | `src/data/faqs.ts` | 6 Q&A pairs |
| `app_data.dart` (`technologies`) | `src/data/technologies.ts` | tech badges by category |
| `app_data.dart` (`stats`) | `src/data/stats.ts` | 4 stat tiles |
| `app_data.dart` (`projects`) | `src/content/projects/*.md` | 8 projects — title, subtitle, domain, overview, techStack[], features[], keyDeliverables[], screenshots[], appStoreUrl → **content collection**, one file per project, `id` becomes the slug/filename |
| `lib/core/data/instagram_posts_data.dart` (`instagramPosts`) | `src/content/blog/*.md` | 6 blog posts — `caption` becomes the Markdown body, `seoTitle`/`metaDescription`/`seoKeywords`/`ogTitle`/`ogDescription`/`slug` become frontmatter → **content collection** |
| `web/index.html` meta tags | `src/layouts/Layout.astro` `<head>` | already-correct SEO copy carries over verbatim (title, description, keywords, OG/Twitter tags, schema.org JSON-LD) |
| `web/robots.txt`, `web/sitemap.xml` | copied as-is into `public/` | no changes needed — Astro's static output serves these the same way |
| `lib/core/theme/app_colors.dart`, `app_theme.dart` | `src/styles/tokens.css` (CSS custom properties) | color palette + light/dark theme, direct port |
| `lib/core/utils/emailjs_service.dart` + `recaptcha_service.dart` | `src/scripts/contact-form.js` | same two services, vanilla JS instead of Dart/JS interop |

## Component breakdown (homepage sections → Astro components)

Each current `lib/sections/*.dart` becomes one `.astro` component in
`src/components/`, reading from the corresponding `src/data/*.ts` file:

`Hero.astro`, `Services.astro`, `Solutions.astro`, `Technologies.astro`,
`WhyOneView.astro`, `Process.astro`, `About.astro`, `Faq.astro`,
`Contact.astro`, `Footer.astro`, `Nav.astro`

Animations: the orbit/particle hero animation and scroll-fade-ins are
Flutter `CustomPainter`/`AnimationController` code with no direct HTML/CSS
equivalent. Recommend **simplifying** to a CSS gradient + `@keyframes` for
the hero, and `IntersectionObserver`-triggered fade-ins for scroll
animations — visually close, a fraction of the effort, no canvas needed
(canvas would reintroduce the same crawlability problem for anything drawn
on it, so it must stay decorative/optional, never load-bearing for content).

## Build order (highest lead-value first)

1. **Scaffold** — `npm create astro@latest`, `Layout.astro` (nav, footer,
   meta tag pattern, theme CSS vars), GitHub Actions workflow update
2. **Homepage** — all 9 sections; this is what most visitors and search
   results land on
3. **Blog** — list page + 6 post pages; currently 100% wasted SEO content,
   quickest win once the layout exists (mostly content migration, not new
   design)
4. **Projects** — list page + 8 detail pages with image galleries; lower
   urgency, portfolio proof rather than search-intent content
5. **Contact form** — EmailJS + reCAPTCHA v3 wiring, cooldown/rate-limit
   logic ported from `contact_section.dart`
6. **QA** — cross-browser, responsive, Lighthouse/Core Web Vitals check,
   verify `curl -A Googlebot` now returns real text

## Time estimate

Roughly **6–10 hours** total, across 2–4 sessions:

| Piece | Est. time |
|---|---|
| Scaffold + shared layout | 30–45 min |
| Homepage (9 sections) | 1.5–3 hrs |
| Blog (6 posts + list) | 45 min–1.5 hrs |
| Projects (8 details + list) | 1–2 hrs |
| Contact form | 30–45 min |
| Deploy workflow | 30 min |
| QA | 30–60 min |

Range depends mainly on how closely we recreate Flutter's custom animations
vs. simplifying them to CSS equivalents (recommended — see above).

## What carries over unchanged

- All rewritten copy (client-facing positioning from the earlier copy pass)
- `robots.txt`, `sitemap.xml`, meta tag content, schema.org JSON-LD
- Color palette, typography, GitHub Pages hosting, custom domain (`CNAME`)
- EmailJS + reCAPTCHA v3 as the contact form backend

## What changes

- Rendering technology only: Flutter canvas → real static HTML/CSS
- Build tool: `flutter build web` → `astro build`
- No more Dart/Flutter toolchain needed to edit site content
