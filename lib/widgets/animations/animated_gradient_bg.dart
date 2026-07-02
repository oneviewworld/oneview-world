import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  final bool isDark;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
    required this.isDark,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GradientPainter(
            animation: _controller.value,
            isDark: widget.isDark,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double animation;
  final bool isDark;

  _GradientPainter({required this.animation, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = animation * 2 * math.pi;

    // Draw floating orbs
    _drawOrb(
      canvas,
      Offset(
        size.width * (0.3 + 0.1 * math.sin(offset)),
        size.height * (0.3 + 0.1 * math.cos(offset)),
      ),
      size.width * 0.4,
      isDark
          ? const Color(0xFF6366F1).withValues(alpha: 0.08)
          : const Color(0xFF6366F1).withValues(alpha: 0.04),
    );

    _drawOrb(
      canvas,
      Offset(
        size.width * (0.7 + 0.1 * math.cos(offset * 0.7)),
        size.height * (0.6 + 0.1 * math.sin(offset * 0.7)),
      ),
      size.width * 0.35,
      isDark
          ? const Color(0xFF8B5CF6).withValues(alpha: 0.06)
          : const Color(0xFF8B5CF6).withValues(alpha: 0.03),
    );

    _drawOrb(
      canvas,
      Offset(
        size.width * (0.5 + 0.15 * math.sin(offset * 1.3)),
        size.height * (0.8 + 0.05 * math.cos(offset * 1.3)),
      ),
      size.width * 0.3,
      isDark
          ? const Color(0xFF06B6D4).withValues(alpha: 0.05)
          : const Color(0xFF06B6D4).withValues(alpha: 0.03),
    );
  }

  void _drawOrb(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0)],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      );
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_GradientPainter oldDelegate) =>
      animation != oldDelegate.animation || isDark != oldDelegate.isDark;
}
