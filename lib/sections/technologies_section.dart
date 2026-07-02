import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';
import '../widgets/animations/fade_in_widget.dart';

class TechnologiesSection extends StatefulWidget {
  const TechnologiesSection({super.key});

  @override
  State<TechnologiesSection> createState() => _TechnologiesSectionState();
}

class _TechnologiesSectionState extends State<TechnologiesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            return FadeInWidget(
              delay: Duration(milliseconds: 60 * index),
              child: SizedBox(
                width: columns == 1 ? constraints.maxWidth : itemWidth,
                child: _TechCard(
                  name: tech.name,
                  category: tech.category,
                  icon: tech.icon,
                  color: tech.color,
                  isDark: isDark,
                  animationController: _controller,
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

class _TechCard extends StatefulWidget {
  final String name;
  final String category;
  final IconData icon;
  final Color color;
  final bool isDark;
  final AnimationController animationController;
  final int index;

  const _TechCard({
    required this.name,
    required this.category,
    required this.icon,
    required this.color,
    required this.isDark,
    required this.animationController,
    required this.index,
  });

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          final floatOffset = math.sin(
                widget.animationController.value * 2 * math.pi +
                    widget.index * 0.5,
              ) *
              2;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()
              ..translateByDouble(0.0, _isHovered ? -4.0 : floatOffset, 0.0, 0.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: widget.isDark ? AppColors.darkCard : AppColors.lightCard,
              border: Border.all(
                color: _isHovered
                    ? widget.color.withValues(alpha: 0.4)
                    : (widget.isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder),
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.color.withValues(alpha: 0.15),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [],
            ),
            child: child,
          );
        },
        child: Column(
          children: [
            Icon(widget.icon, color: widget.color, size: 32),
            const SizedBox(height: 12),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              widget.category,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: widget.color,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
