import 'package:flutter/material.dart';
import '../core/constants/app_spacing.dart';
import '../core/data/instagram_posts_data.dart';
import '../widgets/common/section_header.dart';
import '../widgets/instagram/instagram_carousel.dart';

class InstagramSection extends StatelessWidget {
  const InstagramSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: padding.vertical / 2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding.horizontal / 2),
            child: const SectionHeader(
              badge: 'Instagram',
              title: 'From Our Feed',
              subtitle:
                  'Latest insights, design tips, and behind-the-scenes from '
                  'our Instagram. Follow us @oneview.world',
            ),
          ),
          const SizedBox(height: 40),
          InstagramCarousel(posts: instagramPosts),
        ],
      ),
    );
  }
}
