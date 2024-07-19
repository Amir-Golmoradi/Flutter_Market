import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.obscureText,
    required this.prefixIcon,
    required this.controller,
    super.key,
    this.keyboardType,
    this.contentPadding,
    this.suffixIcon,
  });

  final bool obscureText;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = context.currentTheme;
    final isDesktop = Responsive.isDesktop(context);
    double width(double number) => context.screenWidth(number);
    double height(double number) => context.screenHeight(number);

    return Container(
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(7),
      ),
      margin: isDesktop
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 20),
      width: isDesktop ? width(0.22) : width(0.9),
      height: height(0.07),
      child: TextField(
        cursorColor: theme.primary,
        cursorWidth: 1.3,
        cursorHeight: isDesktop ? height(0.02) : height(0.03),
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: theme.surface),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: theme.secondary),
          ),
          //
          fillColor: theme.inversePrimary,
          hintStyle: GoogleFonts.mulish(
            fontSize: AppSize.smallText,
            fontWeight: FontWeight.w400,
            color: theme.primary,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: theme.primary,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: theme.primary,
          ),
        ),
      ),
    );
  }
}
