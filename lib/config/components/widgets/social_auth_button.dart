import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    required this.child,
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: context.currentTheme.surface),
          borderRadius: BorderRadius.circular(16),
          color: context.currentTheme.inversePrimary,
        ),
        child: child,
      ),
    );
  }
}
