import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Base spacing scale
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
  static const double section = 96;
  static const double sectionLarge = 128;

  // Max content width
  static const double maxWidth = 1200;
  static const double maxWidthWide = 1400;
  static const double maxWidthNarrow = 800;

  // Responsive breakpoints
  static const double breakpointMobile = 600;
  static const double breakpointTablet = 900;
  static const double breakpointDesktop = 1200;
  static const double breakpointWide = 1600;

  // Section padding
  static EdgeInsets sectionPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < breakpointMobile) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 64);
    } else if (width < breakpointTablet) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 80);
    } else if (width < breakpointDesktop) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 96);
    }
    return const EdgeInsets.symmetric(horizontal: 64, vertical: 120);
  }

  // Responsive grid columns
  static int gridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < breakpointMobile) return 1;
    if (width < breakpointTablet) return 2;
    if (width < breakpointDesktop) return 3;
    return 4;
  }

  static int serviceGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < breakpointMobile) return 1;
    if (width < breakpointTablet) return 2;
    return 3;
  }
}
