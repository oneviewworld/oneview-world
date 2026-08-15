class InstagramPost {
  final String id;
  final String imageAsset;
  final List<String> allImages;
  final String postUrl;
  final String caption;
  final int likes;
  final DateTime date;

  const InstagramPost({
    required this.id,
    required this.imageAsset,
    this.allImages = const [],
    required this.postUrl,
    required this.caption,
    required this.likes,
    required this.date,
  });

  /// All images for this post (uses allImages if provided, otherwise just the thumbnail)
  List<String> get images => allImages.isNotEmpty ? allImages : [imageAsset];

  /// Short preview of caption (first line or first 80 chars)
  String get captionPreview {
    final firstLine = caption.split('\n').first;
    if (firstLine.length <= 80) return firstLine;
    return '${firstLine.substring(0, 77)}...';
  }

  /// Title derived from first line of caption
  String get title {
    final firstLine = caption.split('\n').first;
    if (firstLine.length <= 60) return firstLine;
    return '${firstLine.substring(0, 57)}...';
  }
}
