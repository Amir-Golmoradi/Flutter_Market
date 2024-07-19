import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/components/widgets/validate_button.dart';
import 'package:flutter_dunimarket/config/constant/constants.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/extensions/theme_extension.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class CheckOTPScreen extends StatefulWidget {
  const CheckOTPScreen({super.key});

  @override
  State<CheckOTPScreen> createState() => _CheckOTPScreenState();
}

class _CheckOTPScreenState extends State<CheckOTPScreen> {
  late final FocusNode focusNode;
  late final SmsRetriever smsRetriever;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController pinController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.currentTheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: context.currentTheme.primary,
          onPressed: () {
            context.replaceNamed(RouterName.forget);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MyText(
                title: 'Verification Code',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.appBarText,
                  color: context.currentTheme.primary,
                ),
              ),
              AppSpacer.p8(),
              MyText(
                title: otpSubtitle,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.smallText,
                  color: context.currentTheme.primary,
                ),
              ),

              /* OTP Input field */
              AppSpacer.p64(),
              FractionallySizedBox(
                widthFactor: context.screenWidth(0.8),
                child: const Pinput(
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              /* OTP Expire timer */
              AppSpacer.p24(),
              MyText(
                title: 'Code expires in 02:30',
                textStyle: TextStyle(
                  fontSize: AppSize.smallText,
                  color: context.currentTheme.primary,
                ),
              ),
              /*OTP Verification Button */
              AppSpacer.p24(),
              ValidateButton(
                title: 'Verify',
                onPressed: () {},
                onComplete: () {},
              ),
              /*OTP Resend Button */
              AppSpacer.p24(),
              MyText(
                title: 'Did not receive OTP? Resend',
                textStyle: TextStyle(
                  fontSize: AppSize.smallText,
                  color: context.currentTheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
