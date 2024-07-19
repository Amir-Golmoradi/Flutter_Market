import 'package:flutter/material.dart';

extension AppThemeContext on BuildContext {
  ColorScheme get currentTheme => Theme.of(this).colorScheme;
}
