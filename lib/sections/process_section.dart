import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/section_header.dart';
import '../widgets/animations/fade_in_widget.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

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
                badge: 'Our Process',
                title: 'From Idea to\nDelivery',
                subtitle:
                    'A structured, transparent process that keeps you informed '
                    'and in control at every stage of development.',
              ),
              const SizedBox(height: 64),
              _buildTimeline(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, bool isDark) {
    final isMobile = Responsive.isMobile(context);
    final steps = AppData.processSteps;

    if (isMobile) {
      return Column(
        children: List.generate(steps.length, (index) {
          return FadeInWidget(
            delay: Duration(milliseconds: 100 * index),
            child: _MobileTimelineItem(
              step: steps[index],
              isLast: index == steps.length - 1,
              isDark: isDark,
            ),
          );
        }),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 20.0;
        final columns = constraints.maxWidth > 1000 ? 4 : 2;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(steps.length, (index) {
            return FadeInWidget(
              delay: Duration(milliseconds: 100 * index),
              child: SizedBox(
                width: itemWidth,
                child: _DesktopTimelineItem(
                  step: steps[index],
                  isDark: isDark,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _DesktopTimelineItem extends StatefulWidget {
  final Map<String, String> step;
  final bool isDark;

  const _DesktopTimelineItem({required this.step, required this.isDark});

  @override
  State<_DesktopTimelineItem> createState() => _DesktopTimelineItemState();
}

class _DesktopTimelineItemState extends State<_DesktopTimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translateByDouble(0.0, _isHovered ? -4.0 : 0.0, 0.0, 0.0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.isDark ? AppColors.darkCard : AppColors.lightCard,
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.3)
                : (widget.isDark
                    ? AppColors.darkBorder
                    : AppColors.lightBorder),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.step['number']!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.step['title']!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              widget.step['description']!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileTimelineItem extends StatelessWidget {
  final Map<String, String> step;
  final bool isLast;
  final bool isDark;

  const _MobileTimelineItem({
    required this.step,
    required this.isLast,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    step['number']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step['title']!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    step['description']!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
