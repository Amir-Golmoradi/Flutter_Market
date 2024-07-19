import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dunimarket/config/components/widgets/field_title.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_app_bar.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text_field.dart';
import 'package:flutter_dunimarket/config/components/widgets/social_auth_button.dart';
import 'package:flutter_dunimarket/config/components/widgets/validate_button.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:flutter_dunimarket/features/auth-feature/intent/bloc/auth_bloc.dart';
import 'package:flutter_dunimarket/features/public-feature/intent/change-theme-intent-cubit/change_theme_intent_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.currentTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.currentTheme.surface,
      appBar: MyAppBar(
        title: 'SIGN UP',
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AppSpacer.p32(),
              Icon(
                AntDesign.lock_fill,
                size: 100,
                color: context.currentTheme.onSurface,
              ),
              AppSpacer.p8(),
              MyText(
                title: "Let's create an account for you!",
                textStyle: GoogleFonts.mulish(
                  fontSize: AppSize.smallText,
                  fontWeight: FontWeight.w400,
                  color: theme.onSurface.withOpacity(0.8),
                ),
              ),
              AppSpacer.p16(),

              //& SIGN UP text forms
              SignUpFormWidget(),
              AppSpacer.p32(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    MyText(
                      title: 'Or continue with',
                      textStyle: TextStyle(
                        fontSize: AppSize.smallText,
                        color: context.currentTheme.onSurface,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacer.p16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialAuthButton(
                    onTap: () {},
                    child: Brand(Brands.google, size: 31),
                  ),
                  AppSpacer.p8(),
                  SocialAuthButton(
                    onTap: () {},
                    child: const Icon(Bootstrap.phone, size: 31),
                  ),
                ],
              ),
              /* Not a member? Register now  */
              AppSpacer.p32(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: 'Already a member?',
                    textStyle: GoogleFonts.mulish(
                      fontSize: AppSize.smallText,
                      color: context.currentTheme.onSurface,
                    ),
                  ),
                  SizedBox(width: context.screenWidth(0.009)),
                  InkWell(
                    onTap: () {
                      context.goNamed(RouterName.login);
                    },
                    child: MyText(
                      title: 'Login Now',
                      textStyle: GoogleFonts.mulish(
                        fontSize: AppSize.smallText,
                        color: context.currentTheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFormWidget extends StatefulWidget {
  SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            const FieldTitle(title: 'Email'),
            MyTextField(
              obscureText: false,
              prefixIcon: Icons.person,
              controller: widget.emailController,
              keyboardType: TextInputType.text,
            ),
            AppSpacer.p8(),
            /*password text field*/
            const FieldTitle(title: 'Password'),
            MyTextField(
              obscureText: true,
              prefixIcon: Icons.lock_rounded,
              controller: widget.passwordController,
              keyboardType: TextInputType.text,
            ),
            AppSpacer.p8(),
            const FieldTitle(title: 'Confirm Password'),
            AppSpacer.p8(),
            MyTextField(
              obscureText: true,
              prefixIcon: Icons.lock,
              controller: widget.confirmPasswordController,
              keyboardType: TextInputType.text,
            ),
            AppSpacer.p32(),
            ValidateButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      SignUpEvent(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      ),
                    );
                // SharedPrefHelper().setAuthStatus();

                widget.emailController.clear();
                widget.passwordController.clear();
                widget.confirmPasswordController.clear();
              },
              title: 'SIGN UP',
              onComplete: () {},
            ),
          ],
        );
      },
    );
  }
}
