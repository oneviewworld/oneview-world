import 'package:flutter/material.dart';
import '../core/constants/app_spacing.dart';
import '../core/data/instagram_posts_data.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';
import '../widgets/instagram/instagram_carousel.dart';

class InstagramSection extends StatelessWidget {
  const InstagramSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: padding.vertical / 2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding.horizontal / 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: SectionHeader(
                    badge: 'Instagram',
                    title: 'From Our Feed',
                    subtitle:
                        'Latest insights, design tips, and behind-the-scenes from '
                        'our Instagram. Follow us @oneview.world',
                  ),
                ),
                _ViewAllButton(isDark: isDark),
              ],
            ),
          ),
          const SizedBox(height: 40),
          InstagramCarousel(posts: instagramPosts),
        ],
      ),
    );
  }
}

class _ViewAllButton extends StatefulWidget {
  final bool isDark;

  const _ViewAllButton({required this.isDark});

  @override
  State<_ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<_ViewAllButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          final delegate =
              Router.of(context).routerDelegate as AppRouterDelegate;
          delegate.navigateTo(const AppRoutePath.blogList());
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.4),
            ),
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
