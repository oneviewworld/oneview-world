export interface WhyReason {
  title: string;
  description: string;
  icon: string;
}

export const whyReasons: WhyReason[] = [
  {
    title: 'Quality Engineering',
    description:
      'Every line of code is written with craftsmanship and attention to detail, following industry best practices.',
    icon: 'verified',
  },
  {
    title: 'Scalable Architecture',
    description:
      'Systems designed to grow with your business, handling increased load without compromising performance.',
    icon: 'architecture',
  },
  {
    title: 'Cross-Platform Expertise',
    description:
      'Deep expertise in Flutter, .NET MAUI, and native development for unified multi-platform solutions.',
    icon: 'devices',
  },
  {
    title: 'Business Focused',
    description:
      'Technology decisions driven by business outcomes, not trends. Every solution maps to real business value.',
    icon: 'trending',
  },
  {
    title: 'Performance First',
    description:
      'Applications optimized for speed, responsiveness, and resource efficiency across all platforms.',
    icon: 'speed',
  },
  {
    title: 'Secure Development',
    description:
      'Security built into every layer, from secure coding practices to infrastructure hardening.',
    icon: 'shield',
  },
  {
    title: 'Maintainable Code',
    description:
      'Clean, well-documented, and testable code that your team can confidently maintain and extend.',
    icon: 'code',
  },
  {
    title: 'Support After Launch',
    description:
      'We do not disappear at launch. Ongoing fixes, updates, and new features as your product grows.',
    icon: 'support',
  },
];
