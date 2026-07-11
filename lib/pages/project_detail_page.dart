import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import '../models/project_model.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int _currentScreenshot = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextScreenshot() {
    if (_currentScreenshot < widget.project.screenshots.length - 1) {
      setState(() => _currentScreenshot++);
      _pageController.animateToPage(
        _currentScreenshot,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousScreenshot() {
    if (_currentScreenshot > 0) {
      setState(() => _currentScreenshot--);
      _pageController.animateToPage(
        _currentScreenshot,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final project = widget.project;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor:
            isDark ? AppColors.darkBackground : AppColors.lightBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            final delegate = Router.of(context).routerDelegate as AppRouterDelegate;
            delegate.navigateTo(const AppRoutePath.home());
          },
        ),
        title: Text(project.title),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 64,
          vertical: 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    project.domain,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Text(project.title,
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                    if (project.appStoreUrl != null)
                      IconButton(
                        onPressed: () => launchUrl(Uri.parse(project.appStoreUrl!)),
                        icon: const Icon(Icons.apple, size: 28),
                        tooltip: 'Download on App Store',
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  project.subtitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                ),
                const SizedBox(height: 24),

                // Screenshot Gallery
                if (project.screenshots.isNotEmpty) ...[
                  _buildScreenshotGallery(context, isDark, isMobile),
                  const SizedBox(height: 32),
                ],

                // Overview
                Text('Overview',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Text(project.overview,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 32),

                // Features
                Text('Key Features',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                ...project.features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle,
                              size: 18, color: AppColors.success),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(f,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium)),
                        ],
                      ),
                    )),
                const SizedBox(height: 32),

                // Key Deliverables
                Text('Key Deliverables',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                ...project.keyDeliverables.map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.rocket_launch,
                              size: 18, color: AppColors.primary),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(d,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium)),
                        ],
                      ),
                    )),
                const SizedBox(height: 32),

                // Tech Stack
                Text('Technology Stack',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.techStack.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkCard : AppColors.lightCard,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                        ),
                      ),
                      child: Text(tech,
                          style: Theme.of(context).textTheme.bodySmall),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenshotGallery(
      BuildContext context, bool isDark, bool isMobile) {
    final screenshots = widget.project.screenshots;
    final isLandscape = widget.project.isScreenshotLandscape;
    final galleryHeight = isLandscape ? 400.0 : (isMobile ? 500.0 : 600.0);

    return Column(
      children: [
        Container(
          height: galleryHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isDark ? AppColors.darkCard : AppColors.lightCard,
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView.builder(
              controller: _pageController,
              itemCount: screenshots.length,
              onPageChanged: (index) =>
                  setState(() => _currentScreenshot = index),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    screenshots[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Navigation controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed:
                  _currentScreenshot > 0 ? _previousScreenshot : null,
              icon: const Icon(Icons.arrow_back_rounded),
              style: IconButton.styleFrom(
                backgroundColor:
                    isDark ? AppColors.darkCard : AppColors.lightCard,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '${_currentScreenshot + 1} / ${screenshots.length}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: _currentScreenshot < screenshots.length - 1
                  ? _nextScreenshot
                  : null,
              icon: const Icon(Icons.arrow_forward_rounded),
              style: IconButton.styleFrom(
                backgroundColor:
                    isDark ? AppColors.darkCard : AppColors.lightCard,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
