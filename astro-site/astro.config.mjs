import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://oneview.world',
  // GitHub Pages serves /page/ and 301-redirects /page to it, so links,
  // canonicals, and the sitemap all use the trailing-slash form.
  trailingSlash: 'always',
  build: {
    format: 'directory',
  },
});
