import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/constant/constants.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    super.key,
    this.tablet,
    this.desktop,
  });
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  /// This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => context.fullWidth < mobileSize;

  static bool isTablet(BuildContext context) =>
      context.fullWidth < tabletSize && context.fullWidth >= mobileSize;

  static bool isDesktop(BuildContext context) =>
      context.fullWidth >= tabletSize;

  @override
  Widget build(BuildContext context) {
    /// If our width is more than 1100 then we consider it a desktop
    if (context.fullWidth >= tabletSize && desktop != null) {
      return desktop!;
    }

    /// If width it less then 1100 and more then 850 we consider it as tablet
    else if (context.fullWidth >= mobileSize && tablet != null) {
      return tablet!;
    }

    /// Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
