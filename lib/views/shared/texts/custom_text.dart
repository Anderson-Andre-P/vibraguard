import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    Key? key,
    required this.text,
    this.softWrap,
    this.maxLines,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.padding,
    required this.style,
  }) : super(key: key);
  final String text;
  final bool? softWrap;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Text(
        text,
        softWrap: softWrap,
        maxLines: maxLines,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: 1,
        style: style,
      ),
    );
  }
}
