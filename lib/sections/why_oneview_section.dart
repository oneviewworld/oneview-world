import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/animations/fade_in_widget.dart';

class WhyOneViewSection extends StatelessWidget {
  const WhyOneViewSection({super.key});

  static const List<IconData> _icons = [
    Icons.verified,
    Icons.architecture,
    Icons.devices,
    Icons.trending_up,
    Icons.speed,
    Icons.shield,
    Icons.code,
    Icons.support_agent,
  ];

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
                badge: 'Why OneView',
                title: 'Why Teams Choose\nOneView',
                subtitle:
                    'A commitment to engineering excellence, scalable design, '
                    'and long-term partnership sets OneView apart.',
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
    final columns = Responsive.isMobile(context) ? 1 : (Responsive.isTablet(context) ? 2 : 4);
    final reasons = AppData.whyOneView;

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(reasons.length, (index) {
            final reason = reasons[index];
            return FadeInWidget(
              delay: Duration(milliseconds: 80 * (index % columns)),
              child: SizedBox(
                width: columns == 1 ? constraints.maxWidth : itemWidth,
                child: _ReasonCard(
                  title: reason['title']!,
                  description: reason['description']!,
                  icon: _icons[index],
                  index: index,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final int index;

  const _ReasonCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.15),
                  AppColors.accent.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
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
