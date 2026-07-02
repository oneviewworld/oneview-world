import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../core/constants/app_spacing.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/section_header.dart';
import '../widgets/animations/fade_in_widget.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

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
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthNarrow),
          child: Column(
            children: [
              const SectionHeader(
                badge: 'FAQ',
                title: 'Frequently Asked\nQuestions',
                subtitle:
                    'Common questions about working with OneView.',
              ),
              const SizedBox(height: 48),
              ...List.generate(AppData.faqs.length, (index) {
                return FadeInWidget(
                  delay: Duration(milliseconds: 80 * index),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _FaqItem(
                      question: AppData.faqs[index]['question']!,
                      answer: AppData.faqs[index]['answer']!,
                      isDark: isDark,
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

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isDark;

  const _FaqItem({
    required this.question,
    required this.answer,
    required this.isDark,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.question,
      expanded: _isExpanded,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isDark ? AppColors.darkCard : AppColors.lightCard,
          border: Border.all(
            color: _isExpanded
                ? AppColors.primary.withValues(alpha: 0.3)
                : (widget.isDark
                    ? AppColors.darkBorder
                    : AppColors.lightBorder),
          ),
        ),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _toggle,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.question,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _animation,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  widget.answer,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
