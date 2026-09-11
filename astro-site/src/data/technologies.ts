export interface Technology {
  name: string;
  category: string;
  color: string;
}

export const technologies: Technology[] = [
  { name: '.NET MAUI', category: 'Mobile', color: '#512BD4' },
  { name: 'Xamarin.Forms', category: 'Mobile', color: '#3498DB' },
  { name: 'Flutter', category: 'Mobile', color: '#02569B' },
  { name: 'Dart', category: 'Mobile', color: '#0175C2' },
  { name: 'C#', category: 'Mobile', color: '#68217A' },
  { name: 'ASP.NET Core', category: 'Backend', color: '#512BD4' },
  { name: 'FastAPI', category: 'Backend', color: '#009688' },
  { name: 'Python', category: 'Backend', color: '#3776AB' },
  { name: 'REST APIs', category: 'Backend', color: '#10B981' },
  { name: 'Ollama', category: 'AI / ML', color: '#8B5CF6' },
  { name: 'Computer Vision', category: 'AI / ML', color: '#EC4899' },
  { name: 'AI Pipelines', category: 'AI / ML', color: '#F59E0B' },
  { name: 'SQL Server', category: 'Database', color: '#CC2927' },
  { name: 'Supabase', category: 'Cloud', color: '#3ECF8E' },
  { name: 'SQLite', category: 'Database', color: '#003B57' },
  { name: 'Azure', category: 'Cloud', color: '#0078D4' },
  { name: 'Git', category: 'Tools', color: '#F05032' },
  { name: 'Docker', category: 'Tools', color: '#2496ED' },
  { name: 'CI/CD', category: 'Tools', color: '#6366F1' },
];
