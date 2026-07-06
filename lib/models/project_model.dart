class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String domain;
  final String overview;
  final List<String> techStack;
  final List<String> features;
  final List<String> keyDeliverables;
  final List<String> screenshots;
  final String? appStoreUrl;
  final bool isFeatured;
  final bool isScreenshotLandscape;
  final bool isPreview;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.domain,
    required this.overview,
    required this.techStack,
    required this.features,
    required this.keyDeliverables,
    this.screenshots = const [],
    this.appStoreUrl,
    this.isFeatured = false,
    this.isScreenshotLandscape = false,
    this.isPreview = false,
  });
}
