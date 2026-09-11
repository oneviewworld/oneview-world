export interface Faq {
  question: string;
  answer: string;
}

export const faqs: Faq[] = [
  {
    question: 'What technologies does OneView specialize in?',
    answer:
      'OneView specializes in Flutter, .NET MAUI, ASP.NET Core, Firebase, Supabase, Azure, and AWS. Our primary focus is building cross-platform mobile applications and scalable backend systems.',
  },
  {
    question: 'How do we get started?',
    answer:
      'It starts with a call about what you want to build. You get a written proposal with scope, timeline, and a fixed price range. Once you approve it, we build in short cycles with a working demo you can try every week or two.',
  },
  {
    question: 'Do you work with startups or enterprises?',
    answer:
      'OneView works with both. We help startups build MVPs and scale their products, and we help enterprises modernize their technology stack and build custom solutions.',
  },
  {
    question: 'What is your typical project timeline?',
    answer:
      'Timelines vary based on complexity. A mobile application MVP typically takes 8-12 weeks, while enterprise solutions may require 4-6 months. We provide accurate estimates during the planning phase.',
  },
  {
    question: 'Do you provide ongoing support after launch?',
    answer:
      'Yes. OneView handles monitoring, fixes, and new features after launch. You are never locked in — you hold all the code and accounts, and can take the project elsewhere at any time.',
  },
  {
    question: 'Can you migrate our existing Xamarin app to .NET MAUI or Flutter?',
    answer:
      'Absolutely. OneView has extensive experience migrating legacy Xamarin applications to .NET MAUI and Flutter, preserving business logic while modernizing the user interface and architecture.',
  },
];
