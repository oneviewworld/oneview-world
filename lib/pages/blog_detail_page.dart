import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/models/instagram_post.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';

class BlogDetailPage extends StatefulWidget {
  final InstagramPost post;

  const BlogDetailPage({super.key, required this.post});

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  int _currentImage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final post = widget.post;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor:
            isDark ? AppColors.darkBackground : AppColors.lightBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            final delegate =
                Router.of(context).routerDelegate as AppRouterDelegate;
            delegate.navigateTo(const AppRoutePath.blogList());
          },
        ),
        title: const Text('Blog'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 64,
          vertical: 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date + Instagram icon row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        _formatDate(post.date),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: isDark
                                  ? AppColors.darkTextTertiary
                                  : AppColors.lightTextTertiary,
                            ),
                      ),
                    ),
                    _InstagramIconButton(
                      onTap: () => launchUrl(Uri.parse(post.postUrl)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Title
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),

                // Image gallery
                _buildImageGallery(context, isDark, isMobile),
                const SizedBox(height: 32),

                // Full caption
                _buildCaption(context, isDark),
                const SizedBox(height: 32),

                // View on Instagram button
                _buildInstagramButton(context, isDark),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageGallery(
      BuildContext context, bool isDark, bool isMobile) {
    final images = widget.post.images;
    final galleryHeight = isMobile ? 350.0 : 500.0;

    return Column(
      children: [
        Container(
          height: galleryHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isDark ? AppColors.darkCard : AppColors.lightCard,
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) =>
                  setState(() => _currentImage = index),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _currentImage > 0
                    ? () {
                        setState(() => _currentImage--);
                        _pageController.animateToPage(
                          _currentImage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_back_rounded),
                style: IconButton.styleFrom(
                  backgroundColor:
                      isDark ? AppColors.darkCard : AppColors.lightCard,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '${_currentImage + 1} / ${images.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: _currentImage < images.length - 1
                    ? () {
                        setState(() => _currentImage++);
                        _pageController.animateToPage(
                          _currentImage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward_rounded),
                style: IconButton.styleFrom(
                  backgroundColor:
                      isDark ? AppColors.darkCard : AppColors.lightCard,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildCaption(BuildContext context, bool isDark) {
    return Text(
      widget.post.caption,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.8,
          ),
    );
  }

  Widget _buildInstagramButton(BuildContext context, bool isDark) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () => launchUrl(Uri.parse(widget.post.postUrl)),
        icon: const Icon(Icons.camera_alt_rounded),
        label: const Text('View on Instagram'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

/// Instagram gradient icon button
class _InstagramIconButton extends StatefulWidget {
  final VoidCallback onTap;

  const _InstagramIconButton({required this.onTap});

  @override
  State<_InstagramIconButton> createState() => _InstagramIconButtonState();
}

class _InstagramIconButtonState extends State<_InstagramIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Tooltip(
          message: 'View on Instagram',
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xFFDD2A7B).withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Image.asset(
              'assets/icons/instagram.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
