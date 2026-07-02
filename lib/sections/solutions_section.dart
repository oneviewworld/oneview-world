import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/animations/fade_in_widget.dart';

class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  static const Map<String, IconData> _iconMap = {
    'local_hospital': Icons.local_hospital,
    'school': Icons.school,
    'storefront': Icons.storefront,
    'account_balance': Icons.account_balance,
    'precision_manufacturing': Icons.precision_manufacturing,
    'business': Icons.business,
    'rocket_launch': Icons.rocket_launch,
    'dashboard_customize': Icons.dashboard_customize,
    'sports_esports': Icons.sports_esports,
    'devices': Icons.devices,
  };

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
                badge: 'Solutions',
                title: 'Industry-Specific\nDigital Solutions',
                subtitle:
                    'OneView builds tailored solutions for diverse industries, '
                    'leveraging deep domain knowledge and technical expertise.',
              ),
              const SizedBox(height: 64),
              _buildGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final columns = AppSpacing.gridColumns(context);
    final solutions = AppData.solutions;

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(solutions.length, (index) {
            final solution = solutions[index];
            return FadeInWidget(
              delay: Duration(milliseconds: 80 * (index % columns)),
              child: SizedBox(
                width: columns == 1 ? constraints.maxWidth : itemWidth,
                child: _SolutionCard(
                  title: solution['title']!,
                  description: solution['description']!,
                  icon: _iconMap[solution['icon']] ?? Icons.code,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _SolutionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _SolutionCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
