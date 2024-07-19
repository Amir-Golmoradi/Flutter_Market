import 'package:flutter/material.dart';

class MySnackBar {
  MySnackBar({
    required this.context,
    required this.content,
    this.behavior,
  });
  final BuildContext context;
  final Widget content;
  final SnackBarBehavior? behavior;

  void show() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: content,
          behavior: behavior,
          duration: const Duration(seconds: 2),
        ),
      );
  }
}
