// App privacy policies served at /policies/<slug>. These URLs are registered
// with the App Store / Play Store, so don't rename a slug once published.

export interface AppPolicy {
  slug: string;
  name: string;
  description: string;
  updated: string;
  localData: string;
}

export const policies: AppPolicy[] = [
  {
    slug: 'bounceup',
    name: 'BounceUp',
    description: 'an offline arcade paddle ball game',
    updated: 'June 20, 2026',
    localData: 'scores, settings, player names',
  },
  {
    slug: 'hopixvalley',
    name: 'Hopix Valley',
    description: 'a 2D platformer game',
    updated: 'July 7, 2025',
    localData: 'progress, settings, preferences',
  },
];

export const policyContactEmail = 'hello@oneview.world';
