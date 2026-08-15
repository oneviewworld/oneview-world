import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/models/instagram_post.dart';
import '../../core/utils/responsive.dart';
import 'instagram_card.dart';

class InstagramCarousel extends StatefulWidget {
  final List<InstagramPost> posts;

  const InstagramCarousel({super.key, required this.posts});

  @override
  State<InstagramCarousel> createState() => _InstagramCarouselState();
}

class _InstagramCarouselState extends State<InstagramCarousel> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  bool _isHovered = false;
  static const double _scrollSpeed = 0.5;
  static const Duration _timerInterval = Duration(milliseconds: 16);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(_timerInterval, (_) {
      if (_isHovered || !_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      if (currentScroll >= maxScroll) {
        // Jump back to start for infinite loop effect
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(currentScroll + _scrollSpeed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final cardWidth = isMobile ? 260.0 : 300.0;
    final cardHeight = isMobile ? 320.0 : 360.0;

    // Duplicate posts for seamless looping
    final displayPosts = [...widget.posts, ...widget.posts, ...widget.posts];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SizedBox(
        height: cardHeight,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: displayPosts.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final post = displayPosts[index];
            return InstagramCard(
              post: post,
              width: cardWidth,
              height: cardHeight,
            );
          },
        ),
      ),
    );
  }
}
