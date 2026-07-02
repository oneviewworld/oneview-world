import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../models/project_model.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/animations/fade_in_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const Map<String, List<Color>> _gradientColors = {
    'health': [Color(0xFF10B981), Color(0xFF06B6D4)],
    'productivity': [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    'retail': [Color(0xFFF59E0B), Color(0xFFEF4444)],
    'education': [Color(0xFF3B82F6), Color(0xFF6366F1)],
    'finance': [Color(0xFF10B981), Color(0xFF3B82F6)],
    'games': [Color(0xFFEC4899), Color(0xFF8B5CF6)],
  };

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);

    return Container(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthWide),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Projects',
                title: 'Featured Work',
                subtitle:
                    'A selection of projects where OneView delivered impactful '
                    'digital solutions for clients across industries.',
              ),
              const SizedBox(height: 64),
              ...List.generate(AppData.projects.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: FadeInWidget(
                    delay: Duration(milliseconds: 100 * index),
                    child: _ProjectCard(
                      project: AppData.projects[index],
                      isReversed: index.isOdd,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final bool isReversed;

  const _ProjectCard({required this.project, required this.isReversed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final colors = ProjectsSection._gradientColors[project.gradient] ??
        [AppColors.primary, AppColors.accent];

    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVisual(context, colors),
                const SizedBox(height: 24),
                _buildContent(context, isDark),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isReversed
                  ? [
                      Expanded(flex: 3, child: _buildContent(context, isDark)),
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: _buildVisual(context, colors)),
                    ]
                  : [
                      Expanded(flex: 2, child: _buildVisual(context, colors)),
                      const SizedBox(width: 32),
                      Expanded(flex: 3, child: _buildContent(context, isDark)),
                    ],
            ),
    );
  }

  Widget _buildVisual(BuildContext context, List<Color> colors) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors.map((c) => c.withValues(alpha: 0.15)).toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors[0].withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getCategoryIcon(project.category),
              size: 48,
              color: colors[0],
            ),
            const SizedBox(height: 12),
            Text(
              project.category,
              style: TextStyle(
                color: colors[0],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            project.category,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text(
          project.overview,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.features.map((feature) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 14,
                  color: AppColors.success,
                ),
                const SizedBox(width: 4),
                Text(
                  feature,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  width: 0.5,
                ),
              ),
              child: Text(
                tech,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'healthcare':
        return Icons.local_hospital;
      case 'productivity':
        return Icons.rocket_launch;
      case 'retail':
        return Icons.storefront;
      case 'education':
        return Icons.school;
      case 'finance':
        return Icons.account_balance;
      case 'games':
        return Icons.sports_esports;
      default:
        return Icons.code;
    }
  }
}
