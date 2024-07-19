import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: MyText(
              title: title,
              textStyle: GoogleFonts.mulish(
                fontSize: AppSize.smallText,
                color: context.currentTheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
        ],
      );
}
