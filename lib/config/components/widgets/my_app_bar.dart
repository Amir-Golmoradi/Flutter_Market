// my_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    required this.title,
    this.appBarIcon,
    this.actions,
    this.leading,
    super.key,
  });
  final String title;
  final IconData? appBarIcon;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: leading,
      title: MyText(
        title: title,
        textStyle: GoogleFonts.mulish(
          fontWeight: FontWeight.w700,
          fontSize: AppSize.appBarText,
          color: context.currentTheme.onSurface,
        ),
        // Add specific styles here
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
