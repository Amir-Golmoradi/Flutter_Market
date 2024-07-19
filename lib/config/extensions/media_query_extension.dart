import 'package:flutter/material.dart';

extension MediaQueryContext on BuildContext {
  double get fullWidth => MediaQuery.sizeOf(this).width;

  Size get fullSize => MediaQuery.sizeOf(this);

  double get fullHeight => MediaQuery.sizeOf(this).height;

  double screenWidth(double number) => MediaQuery.sizeOf(this).width * number;

  double screenHeight(double number) => MediaQuery.sizeOf(this).height * number;
}
