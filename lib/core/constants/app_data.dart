import 'package:flutter/material.dart';
import '../../models/service_model.dart';
import '../../models/project_model.dart';
import '../../models/technology_model.dart';

class AppData {
  AppData._();

  static const List<ServiceModel> services = [
    ServiceModel(
      title: 'Flutter Development',
      description:
          'High-performance cross-platform applications built with Flutter, '
          'delivering native experiences on iOS, Android, Web, and Desktop '
          'from a single codebase.',
      icon: Icons.flutter_dash,
      benefits: [
        'Single codebase for all platforms',
        'Native performance',
        'Beautiful custom UI',
        'Rapid development cycle',
      ],
    ),
    ServiceModel(
      title: 'Android Development',
      description:
          'Native Android applications built with modern architecture patterns, '
          'Kotlin, and Jetpack Compose for optimal performance and user experience.',
      icon: Icons.android,
      benefits: [
        'Native Android performance',
        'Material Design 3',
        'Modern architecture',
        'Google Play optimization',
      ],
    ),
    ServiceModel(
      title: 'iOS Development',
      description:
          'Premium iOS applications crafted with Swift and SwiftUI, following '
          'Apple\'s Human Interface Guidelines for an exceptional user experience.',
      icon: Icons.apple,
      benefits: [
        'Native iOS experience',
        'SwiftUI interfaces',
        'App Store optimization',
        'Apple ecosystem integration',
      ],
    ),
    ServiceModel(
      title: 'Cross-Platform Development',
      description:
          'Unified cross-platform solutions using Flutter and .NET MAUI, '
          'maximizing code reuse while maintaining platform-native behavior.',
      icon: Icons.devices,
      benefits: [
        'Shared business logic',
        'Platform-specific UX',
        'Reduced development cost',
        'Faster time to market',
      ],
    ),
    ServiceModel(
      title: '.NET MAUI & Xamarin',
      description:
          'Enterprise-grade cross-platform applications using .NET MAUI, '
          'including Xamarin migration to modern .NET architectures.',
      icon: Icons.integration_instructions,
      benefits: [
        '.NET ecosystem integration',
        'Enterprise authentication',
        'Xamarin to MAUI migration',
        'Shared C# codebase',
      ],
    ),
    ServiceModel(
      title: 'Backend & API Development',
      description:
          'Scalable RESTful APIs and backend services built with ASP.NET Core, '
          'designed for high availability, security, and performance.',
      icon: Icons.cloud,
      benefits: [
        'Scalable architecture',
        'Secure by design',
        'High availability',
        'Comprehensive documentation',
      ],
    ),
    ServiceModel(
      title: 'Enterprise Software',
      description:
          'Custom enterprise solutions tailored to streamline operations, '
          'automate workflows, and drive digital transformation initiatives.',
      icon: Icons.business,
      benefits: [
        'Process automation',
        'System integration',
        'Data analytics',
        'Compliance ready',
      ],
    ),
    ServiceModel(
      title: 'Healthcare Software',
      description:
          'HIPAA-aware healthcare applications designed for patient engagement, '
          'clinical workflows, and health data management.',
      icon: Icons.local_hospital,
      benefits: [
        'Patient-centric design',
        'Secure data handling',
        'Clinical workflow support',
        'Interoperability',
      ],
    ),
    ServiceModel(
      title: 'Game Development',
      description:
          'Engaging mobile games and interactive experiences built with '
          'Flutter, Unity, and custom game engines for captivating gameplay.',
      icon: Icons.sports_esports,
      benefits: [
        'Cross-platform gaming',
        'Engaging mechanics',
        'Performance optimized',
        'Monetization ready',
      ],
    ),
    ServiceModel(
      title: 'Database Design',
      description:
          'Optimized database architectures using SQL Server, Firebase, '
          'and Supabase for reliable, performant data management.',
      icon: Icons.storage,
      benefits: [
        'Optimized queries',
        'Scalable design',
        'Data integrity',
        'Real-time capabilities',
      ],
    ),
    ServiceModel(
      title: 'Cloud Integration',
      description:
          'End-to-end cloud solutions leveraging Azure and AWS for '
          'hosting, storage, authentication, and scalable infrastructure.',
      icon: Icons.cloud_queue,
      benefits: [
        'Auto-scaling',
        'Global availability',
        'Cost optimization',
        'Managed services',
      ],
    ),
    ServiceModel(
      title: 'UI/UX Design',
      description:
          'Research-driven user experience design and pixel-perfect user '
          'interfaces that delight users and drive engagement.',
      icon: Icons.design_services,
      benefits: [
        'User research',
        'Wireframing & prototyping',
        'Design systems',
        'Usability testing',
      ],
    ),
    ServiceModel(
      title: 'Business Automation',
      description:
          'Intelligent automation solutions that reduce manual effort, '
          'minimize errors, and accelerate business processes.',
      icon: Icons.auto_awesome,
      benefits: [
        'Workflow automation',
        'Reduced manual effort',
        'Error minimization',
        'Process optimization',
      ],
    ),
    ServiceModel(
      title: 'Software Consulting',
      description:
          'Strategic technology consulting to help organizations make '
          'informed decisions about architecture, technology stack, and delivery.',
      icon: Icons.psychology,
      benefits: [
        'Technology assessment',
        'Architecture review',
        'Team augmentation',
        'Technical leadership',
      ],
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'QuickMed Healthcare',
      category: 'Healthcare',
      overview:
          'OneView designed and developed a comprehensive healthcare platform '
          'enabling patients to connect with doctors, manage appointments, '
          'and access medical records securely.',
      challenge:
          'The client needed a HIPAA-aware healthcare platform that could '
          'handle real-time video consultations, secure messaging, and '
          'electronic health records while maintaining a seamless user experience.',
      solution:
          'OneView delivered a cross-platform mobile application with end-to-end '
          'encryption, real-time communication infrastructure, and an intuitive '
          'patient-doctor interface.',
      features: [
        'Video consultations',
        'Appointment scheduling',
        'Secure messaging',
        'Electronic health records',
        'Prescription management',
        'Payment integration',
      ],
      technologies: ['Flutter', 'Firebase', 'ASP.NET Core', 'SQL Server'],
      playStoreUrl: null,
      gradient: 'health',
    ),
    ProjectModel(
      title: 'TaskFlow Pro',
      category: 'Productivity',
      overview:
          'OneView developed an enterprise task management solution with '
          'real-time collaboration, project tracking, and team analytics.',
      challenge:
          'Enterprises needed a unified platform for managing complex projects '
          'across distributed teams with real-time updates and comprehensive '
          'reporting capabilities.',
      solution:
          'OneView delivered a feature-rich project management application '
          'with intuitive drag-and-drop interfaces, real-time sync, and '
          'powerful analytics dashboards.',
      features: [
        'Kanban boards',
        'Real-time collaboration',
        'Team analytics',
        'Time tracking',
        'File management',
        'Integration APIs',
      ],
      technologies: ['Flutter', 'Supabase', 'Dart', 'PostgreSQL'],
      gradient: 'productivity',
    ),
    ProjectModel(
      title: 'RetailEdge POS',
      category: 'Retail',
      overview:
          'OneView designed a modern point-of-sale system for retail businesses, '
          'featuring inventory management, sales analytics, and multi-store support.',
      challenge:
          'Retail businesses required an affordable, reliable POS system that '
          'could work offline, sync across multiple stores, and provide '
          'actionable sales insights.',
      solution:
          'OneView delivered a robust POS application with offline-first '
          'architecture, real-time inventory sync, and comprehensive business '
          'intelligence features.',
      features: [
        'Offline-first architecture',
        'Multi-store sync',
        'Inventory management',
        'Sales analytics',
        'Customer management',
        'Receipt generation',
      ],
      technologies: ['Flutter', '.NET MAUI', 'SQL Server', 'Azure'],
      gradient: 'retail',
    ),
    ProjectModel(
      title: 'EduConnect LMS',
      category: 'Education',
      overview:
          'OneView developed an interactive learning management system '
          'for educational institutions, supporting live classes, '
          'assessments, and student progress tracking.',
      challenge:
          'Educational institutions needed a platform that could support '
          'both synchronous and asynchronous learning while maintaining '
          'student engagement and comprehensive progress analytics.',
      solution:
          'OneView delivered a comprehensive LMS with live streaming, '
          'interactive quizzes, gamification elements, and detailed '
          'analytics for educators.',
      features: [
        'Live streaming classes',
        'Interactive assessments',
        'Progress tracking',
        'Gamification',
        'Discussion forums',
        'Certificate generation',
      ],
      technologies: ['Flutter', 'Firebase', 'Cloud Functions', 'WebRTC'],
      gradient: 'education',
    ),
    ProjectModel(
      title: 'FinanceGuard',
      category: 'Finance',
      overview:
          'OneView designed and developed a personal finance management '
          'application with budget tracking, investment monitoring, and '
          'AI-powered financial insights.',
      challenge:
          'Users needed a comprehensive yet simple financial management tool '
          'that could aggregate data from multiple accounts and provide '
          'personalized financial advice.',
      solution:
          'OneView delivered an elegant finance application with bank '
          'integration, automated categorization, and intelligent spending '
          'pattern analysis.',
      features: [
        'Budget management',
        'Investment tracking',
        'Expense categorization',
        'Financial goals',
        'Bill reminders',
        'Spending insights',
      ],
      technologies: ['Flutter', 'ASP.NET Core', 'SQL Server', 'Azure'],
      gradient: 'finance',
    ),
    ProjectModel(
      title: 'GameVault Arcade',
      category: 'Games',
      overview:
          'OneView developed a collection of engaging casual mobile games '
          'with social features, leaderboards, and cross-platform multiplayer.',
      challenge:
          'The client wanted to create a gaming platform that could host '
          'multiple casual games with shared social features, unified '
          'progression, and cross-platform play.',
      solution:
          'OneView delivered a modular gaming platform with shared services '
          'for authentication, leaderboards, achievements, and social features '
          'across all titles.',
      features: [
        'Cross-platform multiplayer',
        'Global leaderboards',
        'Achievement system',
        'Social features',
        'In-app purchases',
        'Daily challenges',
      ],
      technologies: ['Flutter', 'Firebase', 'Dart', 'Game Engine'],
      playStoreUrl: null,
      gradient: 'games',
    ),
  ];

  static const List<TechnologyModel> technologies = [
    TechnologyModel(
      name: 'Flutter',
      category: 'Frontend',
      icon: Icons.flutter_dash,
      color: Color(0xFF02569B),
    ),
    TechnologyModel(
      name: 'Dart',
      category: 'Language',
      icon: Icons.code,
      color: Color(0xFF0175C2),
    ),
    TechnologyModel(
      name: '.NET MAUI',
      category: 'Frontend',
      icon: Icons.devices,
      color: Color(0xFF512BD4),
    ),
    TechnologyModel(
      name: 'Xamarin',
      category: 'Frontend',
      icon: Icons.phone_android,
      color: Color(0xFF3498DB),
    ),
    TechnologyModel(
      name: 'ASP.NET Core',
      category: 'Backend',
      icon: Icons.dns,
      color: Color(0xFF512BD4),
    ),
    TechnologyModel(
      name: 'C#',
      category: 'Language',
      icon: Icons.code,
      color: Color(0xFF68217A),
    ),
    TechnologyModel(
      name: 'REST APIs',
      category: 'Backend',
      icon: Icons.api,
      color: Color(0xFF10B981),
    ),
    TechnologyModel(
      name: 'SQL Server',
      category: 'Database',
      icon: Icons.storage,
      color: Color(0xFFCC2927),
    ),
    TechnologyModel(
      name: 'Firebase',
      category: 'Cloud',
      icon: Icons.local_fire_department,
      color: Color(0xFFFFA000),
    ),
    TechnologyModel(
      name: 'Supabase',
      category: 'Cloud',
      icon: Icons.bolt,
      color: Color(0xFF3ECF8E),
    ),
    TechnologyModel(
      name: 'Git',
      category: 'DevOps',
      icon: Icons.merge_type,
      color: Color(0xFFF05032),
    ),
    TechnologyModel(
      name: 'GitHub',
      category: 'DevOps',
      icon: Icons.code,
      color: Color(0xFF181717),
    ),
    TechnologyModel(
      name: 'Azure',
      category: 'Cloud',
      icon: Icons.cloud,
      color: Color(0xFF0078D4),
    ),
    TechnologyModel(
      name: 'AWS',
      category: 'Cloud',
      icon: Icons.cloud_queue,
      color: Color(0xFFFF9900),
    ),
    TechnologyModel(
      name: 'Docker',
      category: 'DevOps',
      icon: Icons.view_in_ar,
      color: Color(0xFF2496ED),
    ),
    TechnologyModel(
      name: 'CI/CD',
      category: 'DevOps',
      icon: Icons.loop,
      color: Color(0xFF6366F1),
    ),
  ];

  static const List<Map<String, String>> solutions = [
    {
      'title': 'Healthcare',
      'description':
          'Patient engagement platforms, clinical workflow tools, and health data management systems.',
      'icon': 'local_hospital',
    },
    {
      'title': 'Education',
      'description':
          'Learning management systems, virtual classrooms, and student engagement platforms.',
      'icon': 'school',
    },
    {
      'title': 'Retail',
      'description':
          'Point-of-sale systems, inventory management, and omnichannel commerce platforms.',
      'icon': 'storefront',
    },
    {
      'title': 'Finance',
      'description':
          'Financial management tools, payment processing, and regulatory compliance systems.',
      'icon': 'account_balance',
    },
    {
      'title': 'Manufacturing',
      'description':
          'Production tracking, quality management, and supply chain optimization tools.',
      'icon': 'precision_manufacturing',
    },
    {
      'title': 'Enterprise',
      'description':
          'Custom enterprise resource planning, workflow automation, and business intelligence.',
      'icon': 'business',
    },
    {
      'title': 'Productivity',
      'description':
          'Task management, collaboration tools, and team productivity platforms.',
      'icon': 'rocket_launch',
    },
    {
      'title': 'Internal Tools',
      'description':
          'Custom internal dashboards, admin panels, and operational management systems.',
      'icon': 'dashboard_customize',
    },
    {
      'title': 'Games',
      'description':
          'Casual mobile games, multiplayer experiences, and interactive entertainment.',
      'icon': 'sports_esports',
    },
    {
      'title': 'Cross-Platform',
      'description':
          'Unified applications spanning mobile, web, and desktop with shared codebases.',
      'icon': 'devices',
    },
  ];

  static const List<Map<String, String>> processSteps = [
    {
      'title': 'Discovery',
      'description':
          'Understanding your business goals, user needs, and technical requirements through collaborative workshops.',
      'number': '01',
    },
    {
      'title': 'Planning',
      'description':
          'Defining project scope, architecture, technology stack, and delivery timeline with clear milestones.',
      'number': '02',
    },
    {
      'title': 'Wireframing',
      'description':
          'Creating low-fidelity wireframes and user flows to validate information architecture and navigation.',
      'number': '03',
    },
    {
      'title': 'UI Design',
      'description':
          'Crafting pixel-perfect, accessible interfaces with design systems and interactive prototypes.',
      'number': '04',
    },
    {
      'title': 'Development',
      'description':
          'Agile development with regular demos, code reviews, and continuous integration for quality assurance.',
      'number': '05',
    },
    {
      'title': 'Testing',
      'description':
          'Comprehensive testing including unit, integration, performance, and user acceptance testing.',
      'number': '06',
    },
    {
      'title': 'Deployment',
      'description':
          'Smooth deployment to production with monitoring, analytics, and rollback capabilities.',
      'number': '07',
    },
    {
      'title': 'Support',
      'description':
          'Ongoing maintenance, performance optimization, and feature development as your product evolves.',
      'number': '08',
    },
  ];

  static const List<Map<String, String>> whyOneView = [
    {
      'title': 'Quality Engineering',
      'description':
          'Every line of code is written with craftsmanship and attention to detail, following industry best practices.',
    },
    {
      'title': 'Scalable Architecture',
      'description':
          'Systems designed to grow with your business, handling increased load without compromising performance.',
    },
    {
      'title': 'Cross-Platform Expertise',
      'description':
          'Deep expertise in Flutter, .NET MAUI, and native development for unified multi-platform solutions.',
    },
    {
      'title': 'Business Focused',
      'description':
          'Technology decisions driven by business outcomes, not trends. Every solution maps to real business value.',
    },
    {
      'title': 'Performance First',
      'description':
          'Applications optimized for speed, responsiveness, and resource efficiency across all platforms.',
    },
    {
      'title': 'Secure Development',
      'description':
          'Security built into every layer, from secure coding practices to infrastructure hardening.',
    },
    {
      'title': 'Maintainable Code',
      'description':
          'Clean, well-documented, and testable code that your team can confidently maintain and extend.',
    },
    {
      'title': 'Long-term Support',
      'description':
          'Committed partnerships beyond delivery, with ongoing support, updates, and strategic guidance.',
    },
  ];

  static const List<Map<String, String>> faqs = [
    {
      'question': 'What technologies does OneView specialize in?',
      'answer':
          'OneView specializes in Flutter, .NET MAUI, ASP.NET Core, Firebase, Supabase, Azure, and AWS. Our primary focus is building cross-platform mobile applications and scalable backend systems.',
    },
    {
      'question': 'How does the engagement process work?',
      'answer':
          'Every project begins with a discovery phase to understand your goals and requirements. We then provide a detailed proposal with scope, timeline, and investment. Development follows an agile methodology with regular updates and demonstrations.',
    },
    {
      'question': 'Do you work with startups or enterprises?',
      'answer':
          'OneView works with both. We help startups build MVPs and scale their products, and we help enterprises modernize their technology stack and build custom solutions.',
    },
    {
      'question': 'What is your typical project timeline?',
      'answer':
          'Timelines vary based on complexity. A mobile application MVP typically takes 8-12 weeks, while enterprise solutions may require 4-6 months. We provide accurate estimates during the planning phase.',
    },
    {
      'question': 'Do you provide ongoing support after launch?',
      'answer':
          'Yes. OneView offers ongoing maintenance, performance monitoring, feature development, and technical support. We believe in long-term partnerships, not one-time deliveries.',
    },
    {
      'question': 'Can you migrate our existing Xamarin app to .NET MAUI or Flutter?',
      'answer':
          'Absolutely. OneView has extensive experience migrating legacy Xamarin applications to .NET MAUI and Flutter, preserving business logic while modernizing the user interface and architecture.',
    },
  ];

  static const List<Map<String, dynamic>> stats = [
    {'value': '50+', 'label': 'Projects Delivered'},
    {'value': '30+', 'label': 'Happy Clients'},
    {'value': '6+', 'label': 'Years in Business'},
    {'value': '99%', 'label': 'Client Retention'},
  ];
}
