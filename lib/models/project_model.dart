class ProjectModel {
  final String title;
  final String category;
  final String overview;
  final String challenge;
  final String solution;
  final List<String> features;
  final List<String> technologies;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webUrl;
  final String gradient;

  const ProjectModel({
    required this.title,
    required this.category,
    required this.overview,
    required this.challenge,
    required this.solution,
    required this.features,
    required this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webUrl,
    required this.gradient,
  });
}
