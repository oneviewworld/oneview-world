import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/utils/responsive.dart';
import '../widgets/common/gradient_button.dart';
import '../widgets/common/gradient_text.dart';
import '../widgets/animations/fade_in_widget.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWork;
  final VoidCallback onStartProject;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onStartProject,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _orbitController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _orbitController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: isMobile ? 60 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthWide),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildContent(context, isDark),
                    ),
                    const SizedBox(width: 48),
                    SizedBox(
                      width: 380,
                      height: 380,
                      child: _buildOrbit(context, isDark),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildContent(context, isDark),
                    const SizedBox(height: 48),
                    SizedBox(
                      height: isMobile ? 250 : 320,
                      child: _buildOrbit(context, isDark),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInWidget(
          delay: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.08),
                  AppColors.accent.withValues(alpha: isDark ? 0.1 : 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Available for new projects',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        FadeInWidget(
          delay: const Duration(milliseconds: 400),
          child: GradientText(
            AppConstants.heroHeadline,
            style: isMobile
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(context).textTheme.displayLarge,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 24),
        FadeInWidget(
          delay: const Duration(milliseconds: 600),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              AppConstants.heroDescription,
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const SizedBox(height: 40),
        FadeInWidget(
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              GradientButton(
                text: 'View Our Work',
                onPressed: widget.onViewWork,
                icon: Icons.arrow_forward_rounded,
              ),
              GradientButton(
                text: 'Start Your Project',
                onPressed: widget.onStartProject,
                isOutlined: true,
                icon: Icons.rocket_launch_rounded,
              ),
            ],
          ),
        ),
        const SizedBox(height: 56),
        FadeInWidget(
          delay: const Duration(milliseconds: 1000),
          child: _buildStats(context, isDark),
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context, bool isDark) {
    return Wrap(
      spacing: 32,
      runSpacing: 16,
      children: AppData.stats.map((stat) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stat['value'] as String,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              stat['label'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildOrbit(BuildContext context, bool isDark) {
    return AnimatedBuilder(
      animation: _orbitController,
      builder: (context, child) {
        return CustomPaint(
          painter: _OrbitPainter(
            animation: _orbitController.value,
            pulse: _pulseController.value,
            isDark: isDark,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final double animation;
  final double pulse;
  final bool isDark;

  _OrbitPainter({
    required this.animation,
    required this.pulse,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2.5;

    // Draw orbit rings
    for (int i = 1; i <= 3; i++) {
      final radius = maxRadius * (i / 3);
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = (isDark ? AppColors.darkBorder : AppColors.lightBorder)
            .withValues(alpha: 0.5);
      canvas.drawCircle(center, radius, paint);
    }

    // Draw center glow
    final glowRadius = maxRadius * 0.15 + (pulse * 5);
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.primary.withValues(alpha: 0.6),
          AppColors.primary.withValues(alpha: 0),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: glowRadius * 2),
      );
    canvas.drawCircle(center, glowRadius * 2, glowPaint);

    // Draw center dot
    final centerPaint = Paint()..color = AppColors.primary;
    canvas.drawCircle(center, 8, centerPaint);

    // Draw orbiting dots
    final techs = ['F', 'D', 'C#', 'Az', 'FB', 'Sb'];
    final colors = [
      const Color(0xFF02569B),
      const Color(0xFF0175C2),
      const Color(0xFF68217A),
      const Color(0xFF0078D4),
      const Color(0xFFFFA000),
      const Color(0xFF3ECF8E),
    ];

    for (int i = 0; i < techs.length; i++) {
      final ring = (i % 3) + 1;
      final radius = maxRadius * (ring / 3);
      final angle = (animation * 2 * math.pi) +
          (i * 2 * math.pi / techs.length) +
          (ring * 0.5);
      final speed = 1.0 / ring;
      final adjustedAngle = angle * speed;

      final x = center.dx + radius * math.cos(adjustedAngle);
      final y = center.dy + radius * math.sin(adjustedAngle);

      // Draw dot
      final dotPaint = Paint()..color = colors[i];
      canvas.drawCircle(Offset(x, y), 6, dotPaint);

      // Draw glow around dot
      final dotGlow = Paint()
        ..color = colors[i].withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(Offset(x, y), 8, dotGlow);

      // Draw label
      final textPainter = TextPainter(
        text: TextSpan(
          text: techs[i],
          style: TextStyle(
            color: isDark ? Colors.white70 : Colors.black54,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y + 12),
      );
    }
  }

  @override
  bool shouldRepaint(_OrbitPainter oldDelegate) =>
      animation != oldDelegate.animation ||
      pulse != oldDelegate.pulse ||
      isDark != oldDelegate.isDark;
}
