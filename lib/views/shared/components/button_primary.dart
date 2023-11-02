import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';

class ButtonPrimary extends StatelessWidget {
  final String? title;
  final String? icon;
  final Color? textColor;
  final Color? borderColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? textSize;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final double elevation;

  const ButtonPrimary({
    super.key,
    this.title,
    this.icon,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.height = 52,
    this.textSize = 16,
    @required this.onPressed,
    this.width,
    this.radius,
    this.padding,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextTheme = TextStyle(
      fontSize: textSize!,
      color: textColor ?? R.colors.lightPrimaryBackgroundColor,
      fontWeight: FontWeight.w700,
    );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        height: height!,
        child: MaterialButton(
          elevation: elevation,
          disabledColor: R.colors.lightDisabledInputColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              side: BorderSide(color: borderColor ?? Colors.transparent)),
          color: buttonColor ?? R.colors.lightPrimaryButtonColor,
          onPressed: onPressed,
          child: icon != null
              ? const Icon(Icons.abc_sharp)
              : Text(
                  title!,
                  style: buttonTextTheme,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
