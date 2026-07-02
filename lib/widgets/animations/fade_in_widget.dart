import 'package:flutter/material.dart';

/// Wrapper widget that shows its child directly.
/// Previously animated with fade/slide but caused visibility issues
/// on Flutter Web where off-screen widgets wouldn't paint correctly.
class FadeInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Offset slideOffset;
  final double startScale;

  const FadeInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.slideOffset = const Offset(0, 30),
    this.startScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
