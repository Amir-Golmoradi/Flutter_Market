import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dunimarket/config/components/widgets/field_title.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_form_field.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_snackbar.dart';
import 'package:flutter_dunimarket/config/components/widgets/validate_button.dart';
import 'package:flutter_dunimarket/config/shared/shared_pref_helper.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:flutter_dunimarket/core/security/app_regex.dart';
import 'package:flutter_dunimarket/features/auth-feature/intent/bloc/auth_bloc.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/widgets/login-widgets/forgot_password_bridge.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginFormValidation() async {
    if (_formKey.currentState!.validate()) {
      MySnackBar(
        context: context,
        content: AwesomeSnackbarContent(
          title: 'Congrats :D',
          message: 'Operation completed successfully.',
          contentType: ContentType.success,
        ),
      ).show();
      passwordController.clear();
      await Future.delayed(
        const Duration(milliseconds: 2100),
        () {},
      );
    } else {
      MySnackBar(
        context: context,
        content: AwesomeSnackbarContent(
          title: 'Oh Wait !',
          message: 'Please enter your email.',
          contentType: ContentType.warning,
        ),
      ).show();
    }
  }

  void loginButton() {
    context.read<AuthBloc>().add(
          LoginEvent(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
    SharedPrefHelper().setAuthStatus();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const FieldTitle(title: 'Email'),
              //LOGIN EMAIL FORM FIELD
              MyFormField(
                obscureText: false,
                prefixIcon: Bootstrap.envelope,
                controller: emailController,
                keyboardType: TextInputType.text,
                validator: FormValidator.validateEmail,
              ),
              AppSpacer.p8(),
              const FieldTitle(title: 'Password'),
              AppSpacer.p8(),
              // LOGIN PASSWORD FORM FIELD
              MyFormField(
                obscureText: false,
                prefixIcon: Icons.lock_rounded,
                controller: passwordController,
                keyboardType: TextInputType.text,
                validator: FormValidator.validatePassword,
              ),
              AppSpacer.p8(),
              const ForgotPassText(),
              AppSpacer.p16(),
              // LOGIN BUTTON
              ValidateButton(
                onPressed: loginButton,
                onComplete: loginFormValidation,
                title: 'LOGIN',
              ),
              AppSpacer.p32(),
            ],
          ),
        );
      },
    );
  }
}
