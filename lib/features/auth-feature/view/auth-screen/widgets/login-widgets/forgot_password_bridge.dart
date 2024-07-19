import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassText extends StatelessWidget {
  const ForgotPassText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {
              context.goNamed(RouterName.forget);
            },
            child: MyText(
              title: 'Forgot Password?',
              textStyle: GoogleFonts.mulish(
                fontSize: AppSize.smallText,
                color: context.currentTheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
