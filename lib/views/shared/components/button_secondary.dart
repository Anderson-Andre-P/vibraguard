import 'package:vibraguard/core/helpers/helpers.dart';
import 'package:vibraguard/views/shared/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/resources.dart';

class ButtonSecondary extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? colorBg;
  final Color? borderColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? textSize;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  const ButtonSecondary({
    super.key,
    required this.title,
    this.buttonColor,
    this.colorBg,
    this.textColor,
    this.borderColor,
    this.height = 45,
    this.textSize = 15,
    @required this.onPressed,
    this.width,
    this.radius,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height!,
        color: R.colors.lightPrimaryButtonColor,
        child: MaterialButton(
          elevation: 2,
          disabledColor: R.colors.blueInfo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          color: colorBg ?? Colors.transparent,
          onPressed: onPressed,
          child: TextCustom(
            text: title,
            style: TextStyle(
              color: R.colors.white,
              fontSize: R.fontSize.fs14,
              fontFamily: R.fontFamily.secondaryFont,
              fontWeight: R.fontWeight.medium,
            ),
          ),
        ),
      ),
    );
  }
}
