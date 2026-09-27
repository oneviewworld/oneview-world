export interface TechnologyArea {
  slug: string;
  name: string;
  icon: string;
  color: string;
  description: string;
  languages: string[];
  frameworks: string[];
}

export const technologyAreas: TechnologyArea[] = [
  {
    slug: 'mobile',
    name: 'Mobile App Development',
    icon: 'apple',
    color: '#6366F1',
    description:
      'Native iPhone, iPad, and Android apps that feel right at home on each ' +
      'platform, from first release through App Store and Play Store publishing.',
    languages: ['Swift', 'Objective-C', 'Kotlin', 'Java'],
    frameworks: ['SwiftUI', 'UIKit', 'Jetpack Compose', 'Android SDK', 'Material Design 3'],
  },
  {
    slug: 'cross-platform',
    name: 'Cross-Platform Development',
    icon: 'devices',
    color: '#02569B',
    description:
      'One shared codebase for iOS, Android, web, and desktop, so you launch ' +
      'everywhere faster and maintain a single product instead of several.',
    languages: ['Dart', 'C#', 'TypeScript', 'Kotlin'],
    frameworks: ['Flutter', 'React Native', '.NET MAUI', 'Xamarin.Forms', 'Kotlin Multiplatform'],
  },
  {
    slug: 'web',
    name: 'Web Development',
    icon: 'web',
    color: '#3178C6',
    description:
      'Websites, web apps, SaaS platforms, and admin dashboards that load fast, ' +
      'rank well in search, and work on every screen size.',
    languages: ['TypeScript', 'JavaScript', 'HTML', 'CSS', 'C#'],
    frameworks: ['React', 'Next.js', 'Angular', 'Vue.js', 'Blazor', 'Astro', 'Tailwind CSS', 'Flutter Web'],
  },
  {
    slug: 'desktop',
    name: 'Desktop Applications',
    icon: 'desktop',
    color: '#47848F',
    description:
      'Windows, macOS, and Linux software for offline work, hardware integration, ' +
      'and heavy workloads, including modernizing legacy desktop apps.',
    languages: ['C#', 'TypeScript', 'Rust', 'Swift', 'Dart'],
    frameworks: ['WPF', 'WinUI 3', 'WinForms', 'Electron', 'Tauri', 'Flutter Desktop', '.NET MAUI', 'AppKit'],
  },
  {
    slug: 'backend',
    name: 'Backend & APIs',
    icon: 'code',
    color: '#512BD4',
    description:
      'Secure, scalable server logic and APIs that power your apps, handle ' +
      'authentication and payments, and connect to third-party services.',
    languages: ['C#', 'Python', 'TypeScript', 'JavaScript'],
    frameworks: ['ASP.NET Core', 'Node.js', 'Express', 'FastAPI', 'REST', 'GraphQL'],
  },
  {
    slug: 'ai',
    name: 'AI & Machine Learning',
    icon: 'brain',
    color: '#8B5CF6',
    description:
      'Practical AI built into real products: chat assistants, document ' +
      'extraction, image and video analysis, and private, self-hosted models.',
    languages: ['Python'],
    frameworks: ['Ollama', 'LLM integration', 'RAG', 'Computer Vision', 'YOLO', 'OCR', 'pgvector'],
  },
  {
    slug: 'databases',
    name: 'Databases',
    icon: 'database',
    color: '#CC2927',
    description:
      'Data models designed for speed and integrity, from on-device offline ' +
      'storage to large relational and geospatial databases.',
    languages: ['SQL'],
    frameworks: ['SQL Server', 'PostgreSQL', 'PostGIS', 'SQLite', 'Redis', 'Firestore', 'Isar', 'Hive'],
  },
  {
    slug: 'cloud',
    name: 'Cloud & Hosting',
    icon: 'cloud',
    color: '#0078D4',
    description:
      'Hosting, storage, authentication, and managed backends that scale with ' +
      'your users while keeping running costs predictable.',
    languages: [],
    frameworks: ['Microsoft Azure', 'AWS', 'Firebase', 'Supabase'],
  },
  {
    slug: 'realtime',
    name: 'Real-time & Integrations',
    icon: 'integration',
    color: '#10B981',
    description:
      'Live chat, video calls, push notifications, and integrations with the ' +
      'industry systems your business already depends on.',
    languages: [],
    frameworks: ['WebSockets', 'SignalR', 'WebRTC', 'Supabase Realtime', 'Push Notifications', 'HL7'],
  },
  {
    slug: 'games',
    name: 'Game Development',
    icon: 'game',
    color: '#EC4899',
    description:
      '2D mobile games with polished controls, level design, sound, and ' +
      'monetization, published on both app stores.',
    languages: ['Dart', 'C#'],
    frameworks: ['Flame Engine', 'Flame Tiled', 'Unity'],
  },
  {
    slug: 'devops',
    name: 'DevOps & Delivery',
    icon: 'automation',
    color: '#F05032',
    description:
      'Automated builds, tests, and releases so every update ships reliably ' +
      'to your servers and the app stores.',
    languages: [],
    frameworks: ['Git', 'GitHub Actions', 'Docker', 'CI/CD', 'App Store Connect', 'Google Play Console'],
  },
  {
    slug: 'design',
    name: 'UI/UX Design',
    icon: 'design',
    color: '#F59E0B',
    description:
      'Research-led interface design, clickable prototypes, and reusable ' +
      'design systems that developers can build from directly.',
    languages: [],
    frameworks: ['Figma', 'Design systems', 'Prototyping', 'Material Design', 'Apple HIG'],
  },
];
