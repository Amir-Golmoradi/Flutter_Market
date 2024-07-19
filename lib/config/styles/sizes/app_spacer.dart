import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer({super.key, this.width, this.height});

  factory AppSpacer.p128() => const AppSpacer(width: 128, height: 128);

  factory AppSpacer.p64() => const AppSpacer(width: 64, height: 64);

  factory AppSpacer.p32() => const AppSpacer(width: 32, height: 32);

  factory AppSpacer.p24() => const AppSpacer(width: 24, height: 24);

  factory AppSpacer.p16() => const AppSpacer(width: 16, height: 16);

  factory AppSpacer.p8() => const AppSpacer(width: 8, height: 8);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
