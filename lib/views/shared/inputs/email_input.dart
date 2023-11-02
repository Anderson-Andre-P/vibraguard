import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';
import '../components/input_text.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({
    Key? key,
    this.value,
    this.isOnBlueBg,
    this.title,
    this.borderValidator,
    this.initialValue,
    this.padding,
    this.inputController,
    this.sufixIcon,
    this.iconColor,
  }) : super(key: key);
  final ValueChanged<String>? value;
  final String? title;
  final String? initialValue;
  final EdgeInsets? padding;
  final TextEditingController? inputController;
  final dynamic borderValidator;
  final dynamic isOnBlueBg;
  final IconData? sufixIcon;
  final Color? iconColor;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return InputTextCustom(
      hintText: R.string.loading,
      borderValidator: widget.borderValidator,
      padding: widget.padding,
      isOnBlueBg: widget.isOnBlueBg,
      title: widget.title ?? R.string.loading,
      keyboardType: TextInputType.emailAddress,
      inputController: widget.inputController,
      onChanged: widget.value,
      initialValue: widget.initialValue,
      inputFormatters: const [],
      sufixIcon: widget.sufixIcon,
      iconColor: widget.iconColor,
      validator: (value) {
        if (!EmailValidator.validate(value!.trim()) && value.isNotEmpty) {
          return R.string.msgRequireField;
        }
        return null;
      },
    );
  }
}
