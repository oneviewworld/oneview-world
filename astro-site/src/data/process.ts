export interface ProcessStep {
  number: string;
  title: string;
  description: string;
}

export const processSteps: ProcessStep[] = [
  {
    number: '01',
    title: 'Discovery',
    description:
      'A straightforward conversation about what you want to build, who it is for, and why it matters.',
  },
  {
    number: '02',
    title: 'Planning',
    description:
      'Defining project scope, architecture, technology stack, and delivery timeline with clear milestones.',
  },
  {
    number: '03',
    title: 'Wireframing',
    description:
      'Creating low-fidelity wireframes and user flows to validate information architecture and navigation.',
  },
  {
    number: '04',
    title: 'UI Design',
    description:
      'Crafting pixel-perfect, accessible interfaces with design systems and interactive prototypes.',
  },
  {
    number: '05',
    title: 'Development',
    description:
      'Agile development with regular demos, code reviews, and continuous integration for quality assurance.',
  },
  {
    number: '06',
    title: 'Testing',
    description:
      'Comprehensive testing including unit, integration, performance, and user acceptance testing.',
  },
  {
    number: '07',
    title: 'Deployment',
    description:
      'Smooth deployment to production with monitoring, analytics, and rollback capabilities.',
  },
  {
    number: '08',
    title: 'Support',
    description:
      'Ongoing maintenance, performance optimization, and feature development as your product evolves.',
  },
];
