import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/helpers/resources.dart';
import '../../../core/helpers/utils/theme_util.dart';

class InputTextCustom extends StatefulWidget {
  const InputTextCustom({
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
    this.bgColor,
    this.labelSize,
    this.tooltipMessage,
    this.width,
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
  final Color? bgColor;
  final String? tooltipMessage;
  final double? width;

  @override
  State<InputTextCustom> createState() => _InputTextCustomState();
}

class _InputTextCustomState extends State<InputTextCustom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: widget.width ?? double.infinity,
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
          fillColor: widget.bgColor,
          label: Text('${widget.title}'),
          counter: const Offstage(),
          enabledBorder: widget.initialValue == null
              ? const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8,
                    ),
                  ),
                  borderSide: BorderSide.none,
                )
              : null,
          focusedBorder: widget.isOnBlueBg == true
              ? theme.inputDecorationTheme.focusedBorder!.copyWith(
                  borderSide: BorderSide(
                    color: R.colors.lightBorderColor,
                    width: 4,
                  ),
                )
              : null,
          suffixIcon: widget.sufixIcon != null
              ? Tooltip(
                  richMessage: TextSpan(
                    text: widget.tooltipMessage,
                    style: TextStyle(
                      color: ThemeUtil.isDark(context)
                          ? R.colors.lightCommonTextColor
                          : R.colors.darkCommonTextColor,
                      fontSize: R.fontSize.fs14,
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  height: 16,
                  preferBelow: false,
                  child: IconButton(
                    icon: Icon(widget.sufixIcon),
                    color: widget.iconColor ?? R.colors.lightPrimaryColor,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    disabledColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: 22,
                    onPressed: widget.sufixOnPressed ?? () {},
                  ),
                )
              : widget.sufixImage,
          prefixIcon: widget.inputIcon != null
              ? Icon(
                  widget.inputIcon,
                  color: widget.iconColor ?? R.colors.lightIconColor,
                )
              : null,
        ),
        style: theme.textTheme.titleMedium,
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
