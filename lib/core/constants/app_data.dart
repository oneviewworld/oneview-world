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
      title: 'AI & ML Integration',
      description:
          'Intelligent AI-powered solutions integrating LLMs, computer vision, '
          'and machine learning pipelines into production applications using '
          'Python, FastAPI, and Ollama.',
      icon: Icons.psychology,
      benefits: [
        'LLM & chatbot integration',
        'Computer vision pipelines',
        'Document OCR & extraction',
        'Production AI deployment',
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
      id: 'hopix-valley',
      title: 'Hopix Valley',
      subtitle: '2D Platformer Adventure Game',
      domain: 'Gaming',
      overview:
          'OneView is developing a commercial-grade 2D platformer game built '
          'with Flutter and Flame Engine. Players guide Hopix through 100 '
          'handcrafted levels across 5 themed worlds — Green Meadows, Rocky '
          'Hills, Lava Lands, Snow Mountains, and Sky Islands — collecting '
          'coins, dodging hazards, and earning stars for speed and completion.',
      techStack: ['Flutter', 'Dart', 'Flame Engine', 'Flame Tiled', 'Hive', 'Get_It'],
      features: [
        '100 levels across 5 unique themed worlds',
        'Smooth platformer physics with jump, run, and hazard mechanics',
        'Star-based progression system with time challenges',
        'Parallax scrolling backgrounds with layered depth',
        'Animated sprite characters, collectibles, and hazards',
        'Landscape-optimised with touch controls and keyboard support',
      ],
      keyDeliverables: [
        'Full commercial 2D platformer for iOS and Android',
        'Custom game engine built on Flame with scene management',
        'Tiled-based level editor integration for rapid level design',
      ],
      screenshots: [
        'assets/projects/hopix-valley/screen_1.png',
        'assets/projects/hopix-valley/screen_2.png',
        'assets/projects/hopix-valley/screen_3.png',
        'assets/projects/hopix-valley/screen_4.png',
        'assets/projects/hopix-valley/screen_5.png',
        'assets/projects/hopix-valley/screen_6.png',
        'assets/projects/hopix-valley/screen_7.png',
        'assets/projects/hopix-valley/screen_8.png',
        'assets/projects/hopix-valley/screen_9.png',
      ],
      isFeatured: true,
      isScreenshotLandscape: true,
      isPreview: true,
    ),
    ProjectModel(
      id: 'bounceup',
      title: 'BounceUp',
      subtitle: 'Arcade Paddle Ball Game',
      domain: 'Gaming',
      overview:
          'OneView designed and developed a production-ready arcade paddle ball '
          'game built with Flutter and Flame Engine. The app features '
          'single-player and local two-player modes with neon visuals, '
          'arcade sound effects, and haptic feedback. Published on both '
          'the App Store and Google Play Store.',
      techStack: ['Flutter', 'Dart', 'Flame Engine', 'Riverpod', 'Isar DB', 'GoRouter'],
      features: [
        'Single-player mode with progressive difficulty',
        'Local two-player with simultaneous multi-touch',
        'Neon dark theme with glowing visual effects',
        'Arcade sound effects and haptic feedback',
        'Persistent game history with Isar database',
        'Responsive design for phones and tablets',
      ],
      keyDeliverables: [
        'Published on Apple App Store and Google Play Store',
        'Fully offline — zero network dependencies',
        'Ad-free, no in-app purchases, no data collection',
      ],
      screenshots: [
        'assets/projects/bounceup/screen_1.png',
        'assets/projects/bounceup/screen_2.png',
        'assets/projects/bounceup/screen_3.png',
        'assets/projects/bounceup/screen_4.png',
        'assets/projects/bounceup/screen_5.png',
        'assets/projects/bounceup/screen_6.png',
        'assets/projects/bounceup/screen_7.png',
        'assets/projects/bounceup/screen_8.png',
        'assets/projects/bounceup/screen_9.png',
        'assets/projects/bounceup/screen_10.png',
        'assets/projects/bounceup/screen_11.png',
      ],
      isFeatured: true,
    ),
    ProjectModel(
      id: 'reconvision',
      title: 'ReconVision',
      subtitle: 'AI Platform for Crime & Anomaly Detection',
      domain: 'AI & Security',
      overview:
          'OneView developed an advanced AI-powered surveillance and analytics '
          'platform combining computer vision for crime detection, facial '
          'recognition, violence detection, and behavioural analytics in '
          'real-time video feeds.',
      techStack: ['Flutter', 'Dart', 'Supabase', 'Python', 'FastAPI', 'Ollama', 'Computer Vision'],
      features: [
        'Real-time video feed analysis with computer vision',
        'Face detection and recognition with configurable alerts',
        'Violence and behaviour detection using ML models',
        'Analytics dashboard with heat maps and incident timelines',
        'Multi-camera support with centralised monitoring',
        'Historical incident search with evidence export',
      ],
      keyDeliverables: [
        'Real-time video surveillance and analysis platform',
        'Computer vision models for anomaly detection',
        'Multi-camera centralised monitoring dashboard',
      ],
      screenshots: [
        'assets/projects/reconvision/screen_1.png',
        'assets/projects/reconvision/screen_2.png',
        'assets/projects/reconvision/screen_3.png',
        'assets/projects/reconvision/screen_4.png',
        'assets/projects/reconvision/screen_5.png',
        'assets/projects/reconvision/screen_6.png',
        'assets/projects/reconvision/screen_7.png',
        'assets/projects/reconvision/screen_8.png',
        'assets/projects/reconvision/screen_9.png',
        'assets/projects/reconvision/screen_10.png',
        'assets/projects/reconvision/screen_11.png',
        'assets/projects/reconvision/screen_12.png',
        'assets/projects/reconvision/screen_13.png',
      ],
      isFeatured: true,
      isScreenshotLandscape: true,
    ),
    ProjectModel(
      id: 'digital-butler',
      title: 'Digital Butler',
      subtitle: 'AI-Powered Hotel & Resort Guest Management',
      domain: 'Hospitality',
      overview:
          'OneView delivered an intelligent hospitality platform leveraging AI '
          'to provide personalised guest experiences — from smart room booking '
          'and concierge services to AI-driven recommendations and real-time '
          'guest-staff communication.',
      techStack: ['Flutter', 'Dart', 'Supabase', 'Python', 'FastAPI', 'Ollama', 'Real-time DB'],
      features: [
        'AI-powered concierge chatbot using Ollama LLM',
        'Smart room booking with dynamic pricing',
        'Guest preference learning for personalised service',
        'Real-time communication between guests and staff',
        'Multi-property support with centralised dashboard',
        'Hotel PMS integration for room and housekeeping status',
      ],
      keyDeliverables: [
        'AI concierge with natural language understanding',
        'Smart room booking with dynamic pricing',
        'Guest preference learning and recommendation engine',
      ],
      screenshots: [
        'assets/projects/digital-butler/screen_1.png',
        'assets/projects/digital-butler/screen_2.png',
        'assets/projects/digital-butler/screen_3.png',
        'assets/projects/digital-butler/screen_4.png',
        'assets/projects/digital-butler/screen_5.png',
        'assets/projects/digital-butler/screen_6.png',
        'assets/projects/digital-butler/screen_7.png',
        'assets/projects/digital-butler/screen_8.png',
        'assets/projects/digital-butler/screen_9.png',
        'assets/projects/digital-butler/screen_10.png',
        'assets/projects/digital-butler/screen_11.png',
        'assets/projects/digital-butler/screen_12.png',
        'assets/projects/digital-butler/screen_13.png',
        'assets/projects/digital-butler/screen_14.png',
        'assets/projects/digital-butler/screen_15.png',
        'assets/projects/digital-butler/screen_16.png',
        'assets/projects/digital-butler/screen_17.png',
        'assets/projects/digital-butler/screen_18.png',
        'assets/projects/digital-butler/screen_19.png',
        'assets/projects/digital-butler/screen_20.png',
        'assets/projects/digital-butler/screen_21.png',
        'assets/projects/digital-butler/screen_22.png',
        'assets/projects/digital-butler/screen_23.png',
        'assets/projects/digital-butler/screen_24.png',
        'assets/projects/digital-butler/screen_25.png',
        'assets/projects/digital-butler/screen_26.png',
        'assets/projects/digital-butler/screen_27.png',
        'assets/projects/digital-butler/screen_28.png',
        'assets/projects/digital-butler/screen_29.png',
        'assets/projects/digital-butler/screen_30.png',
        'assets/projects/digital-butler/screen_31.png',
      ],
      isFeatured: true,
    ),
    ProjectModel(
      id: 'smartlogix',
      title: 'SmartLogix',
      subtitle: 'AI-Powered Shipment & Logistics Tracking',
      domain: 'Logistics',
      overview:
          'OneView developed an intelligent logistics platform that uses AI for '
          'shipment registration, route optimisation, delivery prediction, and '
          'real-time tracking — transforming traditional shipping workflows.',
      techStack: ['Flutter', 'Dart', 'Supabase', 'Python', 'FastAPI', 'Ollama', 'OCR'],
      features: [
        'AI-driven shipment registration with document OCR',
        'Real-time GPS tracking with delivery predictions',
        'Route optimisation using ML models',
        'Automated status updates with smart notifications',
        'Multi-carrier integration with unified tracking',
        'Analytics dashboard with shipment performance metrics',
      ],
      keyDeliverables: [
        'AI-powered shipment registration with document OCR',
        'Route optimisation engine with ML models',
        'Multi-carrier unified tracking platform',
      ],
      screenshots: [
        'assets/projects/smartlogix/screen_1.png',
        'assets/projects/smartlogix/screen_2.png',
        'assets/projects/smartlogix/screen_3.png',
        'assets/projects/smartlogix/screen_4.png',
        'assets/projects/smartlogix/screen_5.png',
        'assets/projects/smartlogix/screen_6.png',
        'assets/projects/smartlogix/screen_7.png',
        'assets/projects/smartlogix/screen_8.png',
        'assets/projects/smartlogix/screen_9.png',
        'assets/projects/smartlogix/screen_10.png',
        'assets/projects/smartlogix/screen_11.png',
        'assets/projects/smartlogix/screen_12.png',
        'assets/projects/smartlogix/screen_13.png',
        'assets/projects/smartlogix/screen_14.png',
        'assets/projects/smartlogix/screen_15.png',
        'assets/projects/smartlogix/screen_16.png',
        'assets/projects/smartlogix/screen_17.png',
        'assets/projects/smartlogix/screen_18.png',
        'assets/projects/smartlogix/screen_19.png',
        'assets/projects/smartlogix/screen_20.png',
        'assets/projects/smartlogix/screen_21.png',
        'assets/projects/smartlogix/screen_22.png',
        'assets/projects/smartlogix/screen_23.png',
        'assets/projects/smartlogix/screen_24.png',
        'assets/projects/smartlogix/screen_25.png',
        'assets/projects/smartlogix/screen_26.png',
        'assets/projects/smartlogix/screen_27.png',
        'assets/projects/smartlogix/screen_28.png',
        'assets/projects/smartlogix/screen_29.png',
        'assets/projects/smartlogix/screen_30.png',
        'assets/projects/smartlogix/screen_31.png',
        'assets/projects/smartlogix/screen_32.png',
        'assets/projects/smartlogix/screen_33.png',
        'assets/projects/smartlogix/screen_34.png',
        'assets/projects/smartlogix/screen_35.png',
        'assets/projects/smartlogix/screen_36.png',
      ],
      isFeatured: true,
      isScreenshotLandscape: true,
    ),
    ProjectModel(
      id: 'healthx-patients',
      title: 'HealthxApp for Patients',
      subtitle: 'Enterprise Healthcare Platform',
      domain: 'Healthcare',
      overview:
          'OneView developed a comprehensive patient-facing mobile application '
          'enabling appointment scheduling, secure document management, '
          'HIPAA-compliant video consultations, and real-time chat with '
          'healthcare providers.',
      techStack: ['Xamarin.Forms', 'C#', 'ASP.NET Core', 'SQL Server', 'HL7', 'WebRTC'],
      features: [
        'Appointment booking with provider availability sync',
        'Secure video consultation with encrypted streams',
        'Real-time chat with message history',
        'HL7/FHIR standards for healthcare interoperability',
        'Document upload with secure cloud storage',
        'HIPAA-compliant data handling with encryption',
      ],
      keyDeliverables: [
        'Production-ready patient portal',
        'HIPAA-compliant architecture with security audit clearance',
        'HL7/FHIR integration layer for healthcare data exchange',
      ],
      isFeatured: true,
    ),
    ProjectModel(
      id: 'smd-mobile',
      title: 'SMD Mobile',
      subtitle: 'Hospital & Clinic Management System',
      domain: 'Healthcare',
      overview:
          'OneView delivered a comprehensive hospital and clinic management '
          'mobile application covering patient records, medicine inventory, '
          'appointment scheduling, and clinical workflow automation. '
          'Successfully migrated from Xamarin.Forms to .NET MAUI.',
      techStack: ['.NET MAUI', 'C#', 'SQLite', 'SQL Server', '.NET Core API', 'MVVM'],
      features: [
        'Patient registration and record management',
        'Medicine inventory tracking with stock alerts',
        'Appointment scheduling with automated reminders',
        'Full Xamarin.Forms to .NET MAUI migration',
        'Improved startup time and memory efficiency',
        'REST API integration for backend communication',
      ],
      keyDeliverables: [
        'Complete hospital management mobile application',
        'Successful Xamarin to .NET MAUI migration',
        'Performance-optimised cross-platform app',
      ],
      isFeatured: false,
    ),
    ProjectModel(
      id: 'pinglet',
      title: 'Pinglet',
      subtitle: 'Real-Time Chat Application',
      domain: 'Communication',
      overview:
          'OneView designed and developed a modern, performant real-time '
          'messaging application with instant message delivery, presence '
          'indicators, media sharing, and group conversation support.',
      techStack: ['Flutter', 'Dart', 'Supabase', 'Realtime', 'Push Notifications'],
      features: [
        'Real-time messaging with sub-second delivery',
        'Online/offline presence indicators',
        'Media sharing — images, documents, voice messages',
        'Group chat with admin controls',
        'Message read receipts and typing indicators',
        'Push notifications for background delivery',
      ],
      keyDeliverables: [
        'Real-time messaging app with instant delivery',
        'Presence and typing indicator system',
        'Group chat with admin management',
      ],
      isFeatured: true,
    ),
    ProjectModel(
      id: 'galleryhub',
      title: 'GalleryHub',
      subtitle: 'Cross-Platform Smart Gallery & Media Manager',
      domain: 'Productivity',
      overview:
          'OneView developed a cross-platform gallery application ported from '
          '.NET MAUI to Flutter. Features rich media browsing with grid/list '
          'layouts, folder organisation, full-resolution viewing, native video '
          'playback, camera capture, and batch operations.',
      techStack: ['Flutter', 'Dart', 'Provider', 'photo_manager', 'video_player'],
      features: [
        'Gallery view with grid (2/3/4 columns) or list layout',
        'Full-resolution image viewer with pinch-to-zoom',
        'Native video player with progress scrubbing',
        'Multi-select batch operations (delete, share)',
        'Camera capture for photos and videos',
        'Theme support with system, light, and dark modes',
      ],
      keyDeliverables: [
        'Cross-platform gallery with grid and list browsing',
        'Successful .NET MAUI to Flutter port',
        'Batch operations with multi-select mode',
      ],
      appStoreUrl: 'https://apps.apple.com/in/app/galleryhub/id6766763174',
      isFeatured: false,
    ),
  ];

  static const List<TechnologyModel> technologies = [
    // Mobile
    TechnologyModel(
      name: '.NET MAUI',
      category: 'Mobile',
      icon: Icons.devices,
      color: Color(0xFF512BD4),
    ),
    TechnologyModel(
      name: 'Xamarin.Forms',
      category: 'Mobile',
      icon: Icons.phone_android,
      color: Color(0xFF3498DB),
    ),
    TechnologyModel(
      name: 'Flutter',
      category: 'Mobile',
      icon: Icons.flutter_dash,
      color: Color(0xFF02569B),
    ),
    TechnologyModel(
      name: 'Dart',
      category: 'Mobile',
      icon: Icons.code,
      color: Color(0xFF0175C2),
    ),
    TechnologyModel(
      name: 'C#',
      category: 'Mobile',
      icon: Icons.code,
      color: Color(0xFF68217A),
    ),
    // Backend
    TechnologyModel(
      name: 'ASP.NET Core',
      category: 'Backend',
      icon: Icons.dns,
      color: Color(0xFF512BD4),
    ),
    TechnologyModel(
      name: 'FastAPI',
      category: 'Backend',
      icon: Icons.speed,
      color: Color(0xFF009688),
    ),
    TechnologyModel(
      name: 'Python',
      category: 'Backend',
      icon: Icons.code,
      color: Color(0xFF3776AB),
    ),
    TechnologyModel(
      name: 'REST APIs',
      category: 'Backend',
      icon: Icons.api,
      color: Color(0xFF10B981),
    ),
    // AI / ML
    TechnologyModel(
      name: 'Ollama',
      category: 'AI / ML',
      icon: Icons.psychology,
      color: Color(0xFF8B5CF6),
    ),
    TechnologyModel(
      name: 'Computer Vision',
      category: 'AI / ML',
      icon: Icons.visibility,
      color: Color(0xFFEC4899),
    ),
    TechnologyModel(
      name: 'AI Pipelines',
      category: 'AI / ML',
      icon: Icons.auto_awesome,
      color: Color(0xFFF59E0B),
    ),
    // Database & Cloud
    TechnologyModel(
      name: 'SQL Server',
      category: 'Database',
      icon: Icons.storage,
      color: Color(0xFFCC2927),
    ),
    TechnologyModel(
      name: 'Supabase',
      category: 'Cloud',
      icon: Icons.bolt,
      color: Color(0xFF3ECF8E),
    ),
    TechnologyModel(
      name: 'SQLite',
      category: 'Database',
      icon: Icons.storage,
      color: Color(0xFF003B57),
    ),
    TechnologyModel(
      name: 'Azure',
      category: 'Cloud',
      icon: Icons.cloud,
      color: Color(0xFF0078D4),
    ),
    // Tools
    TechnologyModel(
      name: 'Git',
      category: 'Tools',
      icon: Icons.merge_type,
      color: Color(0xFFF05032),
    ),
    TechnologyModel(
      name: 'Docker',
      category: 'Tools',
      icon: Icons.view_in_ar,
      color: Color(0xFF2496ED),
    ),
    TechnologyModel(
      name: 'CI/CD',
      category: 'Tools',
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
    {'value': '11+', 'label': 'Projects Delivered'},
    {'value': '5', 'label': 'Platforms'},
    {'value': '9+', 'label': 'Years Engineering'},
    {'value': '3+', 'label': 'AI Projects'},
  ];
}
