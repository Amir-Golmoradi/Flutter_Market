import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_app_bar.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/widgets/auth-widget/social_auth_option.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/widgets/login-widgets/go_create_account_widget.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/widgets/login-widgets/login_form_widget.dart';
import 'package:flutter_dunimarket/features/public-feature/intent/change-theme-intent-cubit/change_theme_intent_cubit.dart';
import 'package:flutter_dunimarket/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //
      backgroundColor: context.currentTheme.surface,
      appBar: MyAppBar(
        title: 'LOGIN',
        actions: [
          IconButton(
            onPressed: () =>
                context.read<ChangeThemeIntentCubit>().changeTheme(),
            icon: context.currentTheme.brightness == Brightness.light
                ? const Icon(Icons.nightlight_round_rounded, size: 30)
                : const Icon(Icons.sunny, size: 30),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            _buildHeader(context),
            const LoginFormWidget(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isResponsive =
        Responsive.isDesktop(context) && Responsive.isTablet(context);
    return Column(
      children: [
        AppSpacer.p32(),
        Icon(
          AntDesign.lock_fill,
          size: isResponsive
              ? context.screenWidth(0.25)
              : context.screenWidth(0.28),
          color: context.currentTheme.onSurface,
        ),
        AppSpacer.p8(),
        MyText(
          title: "Welcome back, you've been missed ",
          textStyle: GoogleFonts.mulish(
            fontSize: AppSize.smallText,
            fontWeight: FontWeight.w400,
            color: context.currentTheme.onSurface.withOpacity(0.8),
          ),
        ),
        AppSpacer.p16(),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Expanded(child: Divider(thickness: 0.5)),
              MyText(
                title: 'Or continue with',
                textStyle: GoogleFonts.mulish(
                  fontSize: AppSize.smallText,
                  color: context.currentTheme.onSurface,
                ),
              ),
              const Expanded(child: Divider(thickness: 0.5)),
            ],
          ),
        ),
        AppSpacer.p16(),
        const SocialAuthOptions(),
        AppSpacer.p24(),
        const GoCreateAccount(),
      ],
    );
  }
}
