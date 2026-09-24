import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    subtitle: z.string(),
    domain: z.string(),
    techStack: z.array(z.string()),
    features: z.array(z.string()),
    keyDeliverables: z.array(z.string()),
    screenshots: z.array(z.string()).default([]),
    appStoreUrl: z.string().optional(),
    isFeatured: z.boolean().default(false),
    featuredOrder: z.number().default(50),
    isScreenshotLandscape: z.boolean().default(false),
  }),
});

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    excerpt: z.string(),
    metaDescription: z.string(),
    seoKeywords: z.array(z.string()).default([]),
    ogTitle: z.string().optional(),
    ogDescription: z.string().optional(),
    image: z.string().optional(),
  }),
});

export const collections = { projects, blog };
