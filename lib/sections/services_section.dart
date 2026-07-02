import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/glass_card.dart';
import '../widgets/animations/fade_in_widget.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = AppSpacing.sectionPadding(context);
    final columns = AppSpacing.serviceGridColumns(context);

    return Container(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthWide),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'Services',
                title: 'End-to-End Digital\nDevelopment Services',
                subtitle:
                    'From concept to deployment, OneView delivers comprehensive '
                    'software development services tailored to your business needs.',
              ),
              const SizedBox(height: 64),
              _buildGrid(context, columns),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, int columns) {
    final services = AppData.services;

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(services.length, (index) {
            final service = services[index];
            return FadeInWidget(
              delay: Duration(milliseconds: 100 * (index % columns)),
              child: SizedBox(
                width: columns == 1 ? constraints.maxWidth : itemWidth,
                child: _ServiceCard(service: service),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final dynamic service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.15),
                  AppColors.accent.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              service.icon,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            service.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            service.description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (service.benefits as List<String>).map((benefit) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface
                      : AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color:
                        isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  benefit,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
