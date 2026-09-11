export interface Service {
  title: string;
  description: string;
  icon: string;
  benefits: string[];
}

export const services: Service[] = [
  {
    title: 'Flutter Development',
    description:
      'High-performance cross-platform applications built with Flutter, ' +
      'delivering native experiences on iOS, Android, Web, and Desktop ' +
      'from a single codebase.',
    icon: 'flutter',
    benefits: [
      'Single codebase for all platforms',
      'Native performance',
      'Beautiful custom UI',
      'Rapid development cycle',
    ],
  },
  {
    title: 'Android Development',
    description:
      'Native Android applications built with modern architecture patterns, ' +
      'Kotlin, and Jetpack Compose for optimal performance and user experience.',
    icon: 'android',
    benefits: [
      'Native Android performance',
      'Material Design 3',
      'Modern architecture',
      'Google Play optimization',
    ],
  },
  {
    title: 'iOS Development',
    description:
      "Premium iOS applications crafted with Swift and SwiftUI, following Apple's " +
      'Human Interface Guidelines for an exceptional user experience.',
    icon: 'apple',
    benefits: [
      'Native iOS experience',
      'SwiftUI interfaces',
      'App Store optimization',
      'Apple ecosystem integration',
    ],
  },
  {
    title: 'Cross-Platform Development',
    description:
      'Unified cross-platform solutions using Flutter and .NET MAUI, ' +
      'maximizing code reuse while maintaining platform-native behavior.',
    icon: 'devices',
    benefits: [
      'Shared business logic',
      'Platform-specific UX',
      'Reduced development cost',
      'Faster time to market',
    ],
  },
  {
    title: '.NET MAUI & Xamarin',
    description:
      'Enterprise-grade cross-platform applications using .NET MAUI, ' +
      'including Xamarin migration to modern .NET architectures.',
    icon: 'integration',
    benefits: [
      '.NET ecosystem integration',
      'Enterprise authentication',
      'Xamarin to MAUI migration',
      'Shared C# codebase',
    ],
  },
  {
    title: 'Backend & API Development',
    description:
      'Scalable RESTful APIs and backend services built with ASP.NET Core, ' +
      'designed for high availability, security, and performance.',
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
    description:
      'Intelligent AI-powered solutions integrating LLMs, computer vision, ' +
      'and machine learning pipelines into production applications using ' +
      'Python, FastAPI, and Ollama.',
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
    description:
      'Engaging mobile games and interactive experiences built with ' +
      'Flutter, Unity, and custom game engines for captivating gameplay.',
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
    description:
      'Optimized database architectures using SQL Server, Firebase, ' +
      'and Supabase for reliable, performant data management.',
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
    description:
      'End-to-end cloud solutions leveraging Azure and AWS for ' +
      'hosting, storage, authentication, and scalable infrastructure.',
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
