export interface Solution {
  title: string;
  description: string;
  icon: string;
}

export const solutions: Solution[] = [
  {
    title: 'Healthcare',
    description:
      'Patient engagement platforms, clinical workflow tools, and health data management systems.',
    icon: 'health',
  },
  {
    title: 'Education',
    description:
      'Learning management systems, virtual classrooms, and student engagement platforms.',
    icon: 'school',
  },
  {
    title: 'Retail',
    description:
      'Point-of-sale systems, inventory management, and omnichannel commerce platforms.',
    icon: 'storefront',
  },
  {
    title: 'Finance',
    description:
      'Financial management tools, payment processing, and regulatory compliance systems.',
    icon: 'bank',
  },
  {
    title: 'Manufacturing',
    description:
      'Production tracking, quality management, and supply chain optimization tools.',
    icon: 'factory',
  },
  {
    title: 'Enterprise',
    description:
      'Custom enterprise resource planning, workflow automation, and business intelligence.',
    icon: 'business',
  },
  {
    title: 'Productivity',
    description:
      'Task management, collaboration tools, and team productivity platforms.',
    icon: 'rocket',
  },
  {
    title: 'Internal Tools',
    description:
      'Custom internal dashboards, admin panels, and operational management systems.',
    icon: 'dashboard',
  },
  {
    title: 'Games',
    description:
      'Casual mobile games, multiplayer experiences, and interactive entertainment.',
    icon: 'game',
  },
  {
    title: 'Cross-Platform',
    description:
      'Unified applications spanning mobile, web, and desktop with shared codebases.',
    icon: 'devices',
  },
];
