import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';
import '../../core/theme/theme_provider.dart';

class CustomNavigationBar extends StatefulWidget {
  final ThemeProvider themeProvider;
  final Function(String) onNavItemTap;
  final double scrollProgress;

  const CustomNavigationBar({
    super.key,
    required this.themeProvider,
    required this.onNavItemTap,
    required this.scrollProgress,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isMobileMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeProvider.isDark;
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkBackground.withValues(alpha: 0.85)
                    : AppColors.lightBackground.withValues(alpha: 0.85),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    width: 0.5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Scroll progress
                  LinearProgressIndicator(
                    value: widget.scrollProgress,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                    minHeight: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 32,
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        // Logo
                        _buildLogo(context, isDark),
                        const Spacer(),
                        // Desktop nav
                        if (!isMobile && !isTablet)
                          _buildDesktopNav(context, isDark),
                        // Theme toggle
                        const SizedBox(width: 8),
                        _buildThemeToggle(isDark),
                        // Mobile menu button
                        if (isMobile || isTablet) ...[
                          const SizedBox(width: 8),
                          _buildMobileMenuButton(isDark),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Mobile menu
        if (_isMobileMenuOpen && (isMobile || isTablet))
          _buildMobileMenu(context, isDark),
      ],
    );
  }

  Widget _buildLogo(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () => widget.onNavItemTap(AppConstants.sectionHome),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'O',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'OneView',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context, bool isDark) {
    final navSections = [
      (AppConstants.sectionServices, 'Services'),
      (AppConstants.sectionSolutions, 'Solutions'),
      (AppConstants.sectionProjects, 'Projects'),
      (AppConstants.sectionTechnologies, 'Technologies'),
      (AppConstants.sectionWhyOneView, 'Why OneView'),
      (AppConstants.sectionProcess, 'Process'),
      (AppConstants.sectionAbout, 'About'),
      (AppConstants.sectionContact, 'Contact'),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: navSections.map((item) {
        return _NavItem(
          label: item.$2,
          isDark: isDark,
          onTap: () => widget.onNavItemTap(item.$1),
        );
      }).toList(),
    );
  }

  Widget _buildThemeToggle(bool isDark) {
    return Semantics(
      label: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      child: IconButton(
        onPressed: widget.themeProvider.toggleTheme,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            key: ValueKey(isDark),
            size: 20,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        tooltip: isDark ? 'Light mode' : 'Dark mode',
      ),
    );
  }

  Widget _buildMobileMenuButton(bool isDark) {
    return IconButton(
      onPressed: () => setState(() => _isMobileMenuOpen = !_isMobileMenuOpen),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(
          _isMobileMenuOpen ? Icons.close : Icons.menu,
          key: ValueKey(_isMobileMenuOpen),
          color: isDark ? AppColors.darkText : AppColors.lightText,
        ),
      ),
      tooltip: _isMobileMenuOpen ? 'Close menu' : 'Open menu',
    );
  }

  Widget _buildMobileMenu(BuildContext context, bool isDark) {
    final navSections = [
      (AppConstants.sectionHome, 'Home'),
      (AppConstants.sectionServices, 'Services'),
      (AppConstants.sectionSolutions, 'Solutions'),
      (AppConstants.sectionProjects, 'Projects'),
      (AppConstants.sectionTechnologies, 'Technologies'),
      (AppConstants.sectionWhyOneView, 'Why OneView'),
      (AppConstants.sectionProcess, 'Process'),
      (AppConstants.sectionAbout, 'About'),
      (AppConstants.sectionContact, 'Contact'),
    ];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkBackground.withValues(alpha: 0.95)
                : AppColors.lightBackground.withValues(alpha: 0.95),
            border: Border(
              bottom: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
          ),
          child: Column(
            children: navSections.map((item) {
              return ListTile(
                title: Text(
                  item.$2,
                  style: TextStyle(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  setState(() => _isMobileMenuOpen = false);
                  widget.onNavItemTap(item.$1);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isDark;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _isHovered
                  ? AppColors.primary
                  : (widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
