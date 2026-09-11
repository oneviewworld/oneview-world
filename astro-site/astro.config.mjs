import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://oneview.world',
  trailingSlash: 'never',
  build: {
    format: 'directory',
  },
});
