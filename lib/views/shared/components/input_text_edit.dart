import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/helpers/resources.dart';

class InputTextEditCustom extends StatefulWidget {
  const InputTextEditCustom({
    Key? key,
    required this.keyboardType,
    this.borderValidator,
    this.isOnBlueBg,
    this.isTaped,
    this.title,
    this.inputController,
    this.onTap,
    this.onChanged,
    this.validator,
    this.inputIcon,
    this.inputFormatters,
    this.enabled,
    this.colorFill,
    this.autovalidateMode,
    this.sufixIcon,
    this.sufixOnPressed,
    this.initialValue,
    this.maxLength,
    this.readOnly,
    this.showCursor,
    this.sufixImage,
    this.hintText,
    this.textColor,
    this.iconColor,
    this.padding,
    this.textAlign,
    this.focusNode,
    this.maxLines,
    this.textSize,
    this.labelSize,
  }) : super(key: key);
  final double? textSize;
  final String? initialValue;
  final TextInputType keyboardType;
  final String? title;
  final TextEditingController? inputController;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final IconData? inputIcon;
  final IconData? sufixIcon;
  final Widget? sufixImage;
  final VoidCallback? sufixOnPressed;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final int? maxLength;
  final Color? colorFill;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final bool? showCursor;
  final String? hintText;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final int? maxLines;
  final double? labelSize;
  final bool? isTaped;
  final dynamic borderValidator;
  final dynamic isOnBlueBg;
  final Color? iconColor;

  @override
  State<InputTextEditCustom> createState() => _InputTextEditCustomState();
}

class _InputTextEditCustomState extends State<InputTextEditCustom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 24.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: TextFormField(
          cursorColor: R.colors.lightPrimaryColor,
          enableInteractiveSelection: widget.enabled,
          showCursor: widget.showCursor,
          readOnly: widget.readOnly ?? false,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          controller: widget.inputController,
          keyboardType: widget.keyboardType,
          enabled: widget.enabled ?? true,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          inputFormatters: widget.inputFormatters ?? [],
          decoration: InputDecoration(
            fillColor: R.colors.lightActiveInputColor,
            enabled: widget.enabled ?? true,
            hintText: widget.hintText,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            filled: true,
            label: null,
            counter: const Offstage(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: widget.isOnBlueBg == true
                ? theme.inputDecorationTheme.focusedBorder!
                    .copyWith(borderSide: BorderSide.none)
                : null,
            suffixIcon: widget.sufixIcon != null
                ? IconButton(
                    icon: Icon(widget.sufixIcon),
                    color: widget.iconColor ?? R.colors.lightIconColor,
                    iconSize: 18,
                    onPressed: widget.sufixOnPressed ?? () {},
                  )
                : widget.sufixImage,
            prefixIcon: widget.inputIcon != null
                ? Icon(
                    widget.inputIcon,
                    color: R.colors.lightInputTextColor,
                  )
                : null,
          ),
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: R.fontWeight.normal,
            fontSize: R.fontSize.fs14,
            fontFamily: R.fontFamily.secondaryFont,
            color: R.colors.lightInputTextColor,
          ),
          initialValue: widget.initialValue,
          onTap: widget.onTap ?? () {},
          onChanged: (String newValue) {
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          validator: widget.validator,
        ),
      ),
    );
  }
}
