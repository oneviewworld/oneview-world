import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  final Function(String) onNavItemTap;

  const FooterSection({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : const Color(0xFFF3F4F6),
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthWide),
          child: Column(
            children: [
              isMobile ? _buildMobileFooter(context, isDark) : _buildDesktopFooter(context, isDark),
              const SizedBox(height: 40),
              Divider(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
              const SizedBox(height: 24),
              _buildBottomBar(context, isDark, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBrandColumn(context, isDark)),
        Expanded(flex: 2, child: _buildNavColumn(context, isDark, 'Navigation', [
          ('Services', AppConstants.sectionServices),
          ('Solutions', AppConstants.sectionSolutions),
          ('Projects', AppConstants.sectionProjects),
          ('Technologies', AppConstants.sectionTechnologies),
        ])),
        Expanded(flex: 2, child: _buildNavColumn(context, isDark, 'Company', [
          ('About', AppConstants.sectionAbout),
          ('Process', AppConstants.sectionProcess),
          ('FAQ', AppConstants.sectionFaq),
          ('Contact', AppConstants.sectionContact),
        ])),
        Expanded(flex: 2, child: _buildSocialColumn(context, isDark)),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandColumn(context, isDark),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildNavColumn(context, isDark, 'Navigation', [
              ('Services', AppConstants.sectionServices),
              ('Projects', AppConstants.sectionProjects),
              ('Technologies', AppConstants.sectionTechnologies),
            ])),
            Expanded(child: _buildNavColumn(context, isDark, 'Company', [
              ('About', AppConstants.sectionAbout),
              ('Process', AppConstants.sectionProcess),
              ('Contact', AppConstants.sectionContact),
            ])),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandColumn(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'O',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'OneView',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(
            AppConstants.tagline,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildNavColumn(BuildContext context, bool isDark, String title,
      List<(String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => onNavItemTap(item.$2),
                  child: Text(
                    item.$1,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSocialColumn(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 16),
        _SocialLink(
          label: 'GitHub',
          url: AppConstants.githubUrl,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _SocialLink(
          label: 'LinkedIn',
          url: AppConstants.linkedinUrl,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _SocialLink(
          label: 'Email',
          url: 'mailto:${AppConstants.email}',
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, bool isDark, bool isMobile) {
    final year = DateTime.now().year;
    return isMobile
        ? Column(
            children: [
              Text(
                '© $year OneView. All rights reserved.',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FooterLink(label: 'Privacy Policy', isDark: isDark),
                  const SizedBox(width: 16),
                  _FooterLink(label: 'Terms of Service', isDark: isDark),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© $year OneView. All rights reserved.',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Row(
                children: [
                  _FooterLink(label: 'Privacy Policy', isDark: isDark),
                  const SizedBox(width: 24),
                  _FooterLink(label: 'Terms of Service', isDark: isDark),
                ],
              ),
            ],
          );
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  final String url;
  final bool isDark;

  const _SocialLink({
    required this.label,
    required this.url,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final bool isDark;

  const _FooterLink({required this.label, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
      ),
    );
  }
}
