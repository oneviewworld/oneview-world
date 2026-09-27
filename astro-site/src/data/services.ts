export interface Service {
  title: string;
  description: string;
  icon: string;
  category: 'apps' | 'platform' | 'ai' | 'design';
  /** Anchor on /technologies that lists the tools behind this service. */
  techSlug?: string;
  benefits: string[];
}

export const services: Service[] = [
  {
    title: 'Mobile App Development',
    category: 'apps',
    techSlug: 'mobile',
    description:
      'Native iPhone, iPad, and Android apps that feel right at home on each ' +
      'platform, designed, built, and published to the App Store and Google Play.',
    icon: 'apple',
    benefits: [
      'Native look & feel',
      'Smooth performance',
      'App Store & Play Store launch',
      'Device feature integration',
    ],
  },
  {
    title: 'Cross-Platform Development',
    category: 'apps',
    techSlug: 'cross-platform',
    description:
      'One shared codebase for iOS, Android, web, and desktop, so you launch ' +
      'everywhere faster and maintain one product instead of several.',
    icon: 'devices',
    benefits: [
      'Single codebase',
      'Lower development cost',
      'Faster time to market',
      'Consistent experience',
    ],
  },
  {
    title: 'Web Development',
    category: 'apps',
    techSlug: 'web',
    description:
      'Websites, web apps, SaaS platforms, and admin dashboards that load fast, ' +
      'rank well in search, and work on every screen size.',
    icon: 'web',
    benefits: [
      'Responsive on every screen',
      'SEO & performance tuned',
      'Progressive Web Apps (PWA)',
      'Admin panels & dashboards',
    ],
  },
  {
    title: 'Desktop App Development',
    category: 'apps',
    techSlug: 'desktop',
    description:
      'Software for Windows, macOS, and Linux built for offline work, ' +
      'hardware integration, and heavy everyday workloads.',
    icon: 'desktop',
    benefits: [
      'Windows, macOS & Linux',
      'Offline-first operation',
      'Hardware & device integration',
      'Installer & auto-updates',
    ],
  },
  {
    title: 'App Modernization & Migration',
    category: 'apps',
    techSlug: 'cross-platform',
    description:
      'Move ageing mobile, web, or desktop apps onto modern, supported ' +
      'technology while keeping your data and business logic intact.',
    icon: 'integration',
    benefits: [
      'Legacy app upgrades',
      'Business logic preserved',
      'Refreshed UI & UX',
      'Lower maintenance cost',
    ],
  },
  {
    title: 'Backend & API Development',
    techSlug: 'backend',
    category: 'platform',
    description:
      'Secure, scalable server logic and APIs that power your apps, handle ' +
      'logins and payments, and connect to third-party services.',
    icon: 'cloud',
    benefits: [
      'Scalable architecture',
      'Secure by design',
      'High availability',
      'Comprehensive documentation',
    ],
  },
  {
    title: 'Enterprise Software',
    category: 'platform',
    description:
      'Custom internal software that cuts manual work, replaces the ' +
      'spreadsheets your team lives in, and connects the tools you already use.',
    icon: 'business',
    benefits: [
      'Process automation',
      'System integration',
      'Data analytics',
      'Compliance ready',
    ],
  },
  {
    title: 'Healthcare Software',
    category: 'platform',
    description:
      'HIPAA-aware healthcare applications designed for patient engagement, ' +
      'clinical workflows, and health data management.',
    icon: 'health',
    benefits: [
      'Patient-centric design',
      'Secure data handling',
      'Clinical workflow support',
      'Interoperability',
    ],
  },
  {
    title: 'AI & ML Integration',
    techSlug: 'ai',
    category: 'ai',
    description:
      'Practical AI built into real products: chat assistants, document ' +
      'extraction, image and video analysis, and private, self-hosted models.',
    icon: 'brain',
    benefits: [
      'LLM & chatbot integration',
      'Computer vision pipelines',
      'Document OCR & extraction',
      'Production AI deployment',
    ],
  },
  {
    title: 'Game Development',
    techSlug: 'games',
    category: 'apps',
    description:
      'Engaging mobile games and interactive experiences with polished ' +
      'controls, level design, sound, and monetization.',
    icon: 'game',
    benefits: [
      'Cross-platform gaming',
      'Engaging mechanics',
      'Performance optimized',
      'Monetization ready',
    ],
  },
  {
    title: 'Database Design',
    techSlug: 'databases',
    category: 'platform',
    description:
      'Data models designed for speed and integrity, from on-device offline ' +
      'storage to large relational and real-time databases.',
    icon: 'database',
    benefits: [
      'Optimized queries',
      'Scalable design',
      'Data integrity',
      'Real-time capabilities',
    ],
  },
  {
    title: 'Cloud Integration',
    techSlug: 'cloud',
    category: 'platform',
    description:
      'Hosting, storage, authentication, and managed backends that scale ' +
      'with your users while keeping running costs predictable.',
    icon: 'cloud-queue',
    benefits: [
      'Auto-scaling',
      'Global availability',
      'Cost optimization',
      'Managed services',
    ],
  },
  {
    title: 'UI/UX Design',
    techSlug: 'design',
    category: 'design',
    description:
      'Research-driven user experience design and pixel-perfect user ' +
      'interfaces that delight users and drive engagement.',
    icon: 'design',
    benefits: [
      'User research',
      'Wireframing & prototyping',
      'Design systems',
      'Usability testing',
    ],
  },
  {
    title: 'Business Automation',
    techSlug: 'ai',
    category: 'ai',
    description:
      'Intelligent automation solutions that reduce manual effort, ' +
      'minimize errors, and accelerate business processes.',
    icon: 'automation',
    benefits: [
      'Workflow automation',
      'Reduced manual effort',
      'Error minimization',
      'Process optimization',
    ],
  },
  {
    title: 'Software Consulting',
    category: 'design',
    description:
      'Not sure what to build or which stack to pick? Get a senior review ' +
      'of your plan and a realistic cost and timeline before you commit ' +
      'any budget.',
    icon: 'consulting',
    benefits: [
      'Idea validation',
      'Architecture review',
      'Build vs. buy advice',
      'Realistic cost & timeline',
    ],
  },
];
