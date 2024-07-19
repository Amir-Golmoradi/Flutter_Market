import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/components/widgets/validate_button.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/shared/shared_pref_helper.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.currentTheme.surface,
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              MyText(
                title: 'Welcome',
                textStyle: GoogleFonts.mulish(
                  fontSize: AppSize.bigText,
                  fontWeight: FontWeight.w700,
                  color: context.currentTheme.primary,
                ),
              ),
              MyText(
                title: 'DUNI, Your Shopping House',
                textStyle: GoogleFonts.mulish(
                  fontSize: AppSize.smallText,
                  fontWeight: FontWeight.w700,
                  color: context.currentTheme.primary,
                ),
              ),
              AppSpacer.p16(),
              Lottie.asset(
                'assets/animation/LottieAnimation3.json',
                fit: BoxFit.contain,
                width: context.fullWidth,
              ),
              AppSpacer.p64(),
              ValidateButton(
                onComplete: () {},
                onPressed: () => context.goNamed(RouterName.signup),
                title: 'SIGN UP',
              ),
              ValidateButton(
                onComplete: () {},
                onPressed: () => context.goNamed(RouterName.login),
                title: 'LOGIN',
                bgColor: context.currentTheme.inversePrimary,
                fgColor: context.currentTheme.primary,
              ),
              AppSpacer.p24(),
              GestureDetector(
                onTap: () {
                  // NAVIGATE TO HOME SCREEN
                  SharedPrefHelper().setIntroStatus();
                  context.goNamed(RouterName.home);
                },
                child: const MyText(
                  title: 'No Thanks',
                  textStyle: TextStyle(
                    fontSize: AppSize.normalText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
