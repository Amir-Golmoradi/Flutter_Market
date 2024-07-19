import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/social_auth_button.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_spacer.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialAuthOptions extends StatelessWidget {
  const SocialAuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
