import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/components/widgets/my_text.dart';
import 'package:flutter_dunimarket/config/extensions/media_query_extension.dart';
import 'package:flutter_dunimarket/config/styles/sizes/app_size.dart';
import 'package:flutter_dunimarket/responsive.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidateButton extends StatefulWidget {
  const ValidateButton({
    required this.title,
    required this.onPressed,
    required this.onComplete,
    super.key,
    this.bgColor,
    this.fgColor,
  });

  final String title;
  final Color? bgColor;
  final Color? fgColor;
  final VoidCallback onComplete;
  final void Function()? onPressed;

  @override
  State<ValidateButton> createState() => _ValidateButtonState();
}

class _ValidateButtonState extends State<ValidateButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(
          () {
            isLoading = true;
          },
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            setState(
              () {
                isLoading = false;
              },
            );
            widget.onComplete();
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        foregroundColor: widget.fgColor,
        fixedSize: Size(
          Responsive.isDesktop(context) && Responsive.isTablet(context)
              ? context.screenWidth(0.14)
              : context.screenWidth(0.65),
          context.screenHeight(0.06),
        ),
      ),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCircle(
                  color: Colors.white,
                  size: context.screenWidth(0.09),
                ),
              ],
            )
          : MyText(
              title: widget.title,
              textStyle: GoogleFonts.mulish(
                fontSize: Responsive.isDesktop(context) &&
                        Responsive.isTablet(context)
                    ? AppSize.appBarText
                    : AppSize.normalText,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
