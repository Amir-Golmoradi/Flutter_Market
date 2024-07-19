import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/constant/constants.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/shared/shared_pref_helper.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:flutter_dunimarket/core/generated/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final helper = SharedPrefHelper();
  @override
  void initState() {
    super.initState();
    navigate();
  }

void navigate() {
  Future.delayed(
    const Duration(milliseconds: 2500),
    () async {
      final isAuthenticated = await helper.getAuthStatus();
      
      // Check if the user is authenticated
      if (isAuthenticated) {
        // If the user is authenticated, check the introduction status
        if (await helper.getIntroStatus()) {
          // If the user has seen the intro, navigate to the home screen
          context.goNamed(RouterName.home);
        } else {
          // If the user hasn't seen the intro yet, navigate to the intro screen
          context.goNamed(RouterName.intro);
        }
      } else {
        // If the user is not authenticated, navigate to the auth screen
        context.goNamed(RouterName.auth);
      }
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // context.currentTheme.primary

      backgroundColor: const Color(0xFFCFD5F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.imagesLogo,
              fit: BoxFit.contain,
              width: context.screenWidth(0.4),
            ),
          ),
          AppSpacer.p24(),
          MyText(
            title: appTitle,
            textStyle: GoogleFonts.mulish(
              color: Colors.black,
              fontSize: AppSize.largeText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
