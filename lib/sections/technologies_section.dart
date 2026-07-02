import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';

class TechnologiesSection extends StatelessWidget {
  const TechnologiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface.withValues(alpha: 0.5)
            : AppColors.lightBackground,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthWide),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Technologies',
                title: 'Built With Modern\nTechnology Stack',
                subtitle:
                    'OneView leverages industry-leading technologies to deliver '
                    'robust, scalable, and maintainable solutions.',
              ),
              const SizedBox(height: 64),
              _buildGrid(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, bool isDark) {
    final columns = AppSpacing.gridColumns(context);
    final technologies = AppData.technologies;

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 16.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(technologies.length, (index) {
            final tech = technologies[index];
            return SizedBox(
              width: columns == 1 ? constraints.maxWidth : itemWidth,
              child: _TechCard(
                name: tech.name,
                category: tech.category,
                icon: tech.icon,
                color: tech.color,
                isDark: isDark,
              ),
            );
          }),
        );
      },
    );
  }
}

class _TechCard extends StatelessWidget {
  final String name;
  final String category;
  final IconData icon;
  final Color color;
  final bool isDark;

  const _TechCard({
    required this.name,
    required this.category,
    required this.icon,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            name,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            category,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
