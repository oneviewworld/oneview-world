import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/section_header.dart';
import '../widgets/animations/fade_in_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidth),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'About',
                title: 'About OneView',
                subtitle:
                    'A software development studio focused on building digital '
                    'products that make a difference.',
              ),
              const SizedBox(height: 48),
              FadeInWidget(
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 24 : 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isDark ? AppColors.darkCard : AppColors.lightCard,
                    border: Border.all(
                      color:
                          isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.aboutDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.8,
                            ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Core Values',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          'Quality',
                          'Innovation',
                          'Performance',
                          'Security',
                          'Scalability',
                          'Reliability',
                          'Long-term Partnership',
                        ].map((value) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary
                                      .withValues(alpha: isDark ? 0.12 : 0.06),
                                  AppColors.accent
                                      .withValues(alpha: isDark ? 0.08 : 0.04),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.15),
                              ),
                            ),
                            child: Text(
                              value,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColors.primary),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'OneView partners with organizations that need a reliable '
                        'technology partner to bring their vision to life. From '
                        'initial concept through deployment and beyond, OneView '
                        'delivers end-to-end development services with a focus on '
                        'craft, performance, and long-term maintainability.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.7,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
