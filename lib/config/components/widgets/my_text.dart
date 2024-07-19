import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    required this.title,
    required this.textStyle,
    super.key,
  });

  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: GoogleFonts.mulish(
          textStyle: textStyle,
        ),
        textAlign: TextAlign.center,
      );
}
