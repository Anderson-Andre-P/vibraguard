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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
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
          label: Text('${widget.title}'),
          counter: const Offstage(),
          enabledBorder: widget.initialValue == null
              ? const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none)
              : null,
          focusedBorder: widget.isOnBlueBg == true
              ? theme.inputDecorationTheme.focusedBorder!.copyWith(
                  borderSide:
                      BorderSide(color: R.colors.lightBorderColor, width: 6),
                )
              : null,
          suffixIcon: widget.sufixIcon != null
              ? IconButton(
                  icon: Icon(widget.sufixIcon),
                  color: widget.iconColor ?? R.colors.blueInfo,
                  iconSize: 18,
                  onPressed: widget.sufixOnPressed ?? () {},
                )
              : widget.sufixImage,
          prefixIcon: widget.inputIcon != null
              ? Icon(
                  widget.inputIcon,
                  color: R.colors.lightIconColor,
                )
              : null,
        ),
        style:
            theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        initialValue: widget.initialValue,
        onTap: widget.onTap ?? () {},
        onChanged: (String newValue) {
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        validator: widget.validator,
      ),
    );
  }
}
