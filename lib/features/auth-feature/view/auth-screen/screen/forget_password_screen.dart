import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/field_title.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_form_field.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_snackbar.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/components/widgets/validate_button.dart';
import 'package:flutter_dunimarket/config/constant/constants.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:flutter_dunimarket/core/security/app_regex.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final forgetPasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.currentTheme.surface,
      appBar: AppBar(
        leading: BackButton(
          color: context.currentTheme.primary,
          onPressed: () {
            context.replaceNamed(RouterName.login);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              MyText(
                title: 'Forget Password',
                textStyle: TextStyle(
                  fontSize: AppSize.appBarText,
                  fontWeight: FontWeight.w700,
                  color: context.currentTheme.primary,
                ),
              ),
              AppSpacer.p8(),
              MyText(
                title: forgetPasswordTitle,
                textStyle: TextStyle(
                  fontSize: AppSize.smallText,
                  fontWeight: FontWeight.w700,
                  color: context.currentTheme.primary,
                ),
              ),
              AppSpacer.p8(),
              Image.asset(
                'assets/Images/forget.png',
                fit: BoxFit.contain,
                width: context.screenWidth(0.85),
              ),
              const FieldTitle(title: 'Email'),
              MyFormField(
                obscureText: false,
                prefixIcon: Bootstrap.envelope_fill,
                controller: forgetPasswordController,
                validator: FormValidator.validateEmail,
              ),
              AppSpacer.p16(),
              ValidateButton(
                onPressed: () {},
                title: 'SUBMIT',
                onComplete: () async {
                  if (_formKey.currentState!.validate()) {
                    MySnackBar(
                      context: context,
                      content: AwesomeSnackbarContent(
                        title: 'Congrats :D',
                        message: 'Operation completed successfully.',
                        contentType: ContentType.success,
                      ),
                    ).show();
                    forgetPasswordController.clear();
                    await Future.delayed(
                      const Duration(milliseconds: 2100),
                      () => context.goNamed(RouterName.checkOTP),
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
                },
              ),
              AppSpacer.p16(),
              GestureDetector(
                onTap: () {
                  context.goNamed(RouterName.login);
                },
                child: MyText(
                  title: 'Back to Login',
                  textStyle: TextStyle(
                    fontSize: AppSize.smallText,
                    fontWeight: FontWeight.w700,
                    color: context.currentTheme.primary,
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
