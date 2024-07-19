import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GoCreateAccount extends StatelessWidget {
  const GoCreateAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: 'Not a member?',
          textStyle: GoogleFonts.mulish(
            fontSize: AppSize.smallText,
            color: context.currentTheme.onSurface,
          ),
        ),
        InkWell(
          onTap: () {
            context.goNamed(RouterName.signup);
          },
          child: Padding(
            padding: EdgeInsets.only(left: context.screenWidth(0.009)),
            child: MyText(
              title: 'Register Now',
              textStyle: GoogleFonts.mulish(
                fontSize: AppSize.smallText,
                color: context.currentTheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
