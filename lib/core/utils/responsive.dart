import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';

enum DeviceType { mobile, tablet, desktop, wide }

class Responsive {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < AppSpacing.breakpointMobile) return DeviceType.mobile;
    if (width < AppSpacing.breakpointTablet) return DeviceType.tablet;
    if (width < AppSpacing.breakpointDesktop) return DeviceType.desktop;
    return DeviceType.wide;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppSpacing.breakpointMobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppSpacing.breakpointMobile &&
        width < AppSpacing.breakpointTablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppSpacing.breakpointTablet;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppSpacing.breakpointWide;

  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
    T? wide,
  }) {
    final type = getDeviceType(context);
    switch (type) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? desktop;
      case DeviceType.desktop:
        return desktop;
      case DeviceType.wide:
        return wide ?? desktop;
    }
  }
}
