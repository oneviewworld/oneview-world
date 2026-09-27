export interface ProcessStep {
  number: string;
  title: string;
  description: string;
  icon: string;
  /** What happens during the step (shown on /process/). */
  activities: string[];
  /** What you have in hand when the step is done (shown on /process/). */
  deliverables: string[];
}

export const processSteps: ProcessStep[] = [
  {
    number: '01',
    title: 'Discovery',
    description:
      'A straightforward conversation about what you want to build, who it is for, and why it matters.',
    icon: 'consulting',
    activities: ['Intro call', 'Goals & audience', 'Rough scope', 'Budget range'],
    deliverables: ['Shared understanding', 'Go / no-go on fit'],
  },
  {
    number: '02',
    title: 'Planning',
    description:
      'Defining project scope, architecture, technology stack, and delivery timeline with clear milestones.',
    icon: 'dashboard',
    activities: ['Feature list', 'Architecture', 'Stack choice', 'Milestones'],
    deliverables: ['Written proposal', 'Timeline', 'Fixed price range'],
  },
  {
    number: '03',
    title: 'Wireframing',
    description:
      'Creating low-fidelity wireframes and user flows to validate information architecture and navigation.',
    icon: 'design',
    activities: ['User flows', 'Screen layouts', 'Navigation', 'Early feedback'],
    deliverables: ['Clickable wireframes', 'Agreed user flows'],
  },
  {
    number: '04',
    title: 'UI Design',
    description:
      'Crafting pixel-perfect, accessible interfaces with design systems and interactive prototypes.',
    icon: 'rocket',
    activities: ['Visual style', 'Design system', 'Accessibility', 'Prototype'],
    deliverables: ['Final screen designs', 'Interactive prototype'],
  },
  {
    number: '05',
    title: 'Development',
    description:
      'Agile development with regular demos, code reviews, and continuous integration for quality assurance.',
    icon: 'code',
    activities: ['Short build cycles', 'Code reviews', 'Automated builds', 'Regular demos'],
    deliverables: ['Working demo every 1–2 weeks', 'Source code access'],
  },
  {
    number: '06',
    title: 'Testing',
    description:
      'Comprehensive testing including unit, integration, performance, and user acceptance testing.',
    icon: 'verified',
    activities: ['Unit & integration tests', 'Device testing', 'Performance checks', 'Your acceptance testing'],
    deliverables: ['Tested release build', 'Bug-fix report'],
  },
  {
    number: '07',
    title: 'Deployment',
    description:
      'Smooth deployment to production with monitoring, analytics, and rollback capabilities.',
    icon: 'cloud',
    activities: ['Server setup', 'App Store & Play Store submission', 'Monitoring', 'Analytics'],
    deliverables: ['Live product', 'Accounts in your name'],
  },
  {
    number: '08',
    title: 'Support',
    description:
      'Ongoing maintenance, performance optimization, and feature development as your product evolves.',
    icon: 'support',
    activities: ['Bug fixes', 'Updates for new OS versions', 'Performance tuning', 'New features'],
    deliverables: ['Ongoing care', 'No lock-in'],
  },
];
