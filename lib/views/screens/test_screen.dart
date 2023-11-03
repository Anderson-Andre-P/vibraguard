import 'package:flutter/material.dart';
import 'package:vibraguard/core/formaters/captalizer_test_formater.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/shared/components/button_primary.dart';
import 'package:vibraguard/views/shared/components/button_secondary.dart';
import 'package:vibraguard/views/shared/components/check_box.dart';
import 'package:vibraguard/views/shared/components/input_text.dart';
import 'package:vibraguard/views/shared/components/input_text_edit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = true;
    return Scaffold(
      body: Column(
        children: [
          ButtonPrimary(
            onPressed: () {},
            title: CapitalizerTextFormatter.capitalizeFirstLetter(
                R.string.toStart),
          ),
          CustomCheckBox(
            check: checkboxValue,
            title: "Teste",
            onTap: () => !checkboxValue,
          ),
          const InputTextEditCustom(
            keyboardType: TextInputType.emailAddress,
            enabled: true,
            hintText: "Email",
            inputIcon: Icons.email,
            maxLines: 1,
            borderValidator: Colors.red,
            maxLength: 100,
          ),
          const InputTextCustom(
            keyboardType: TextInputType.emailAddress,
            enabled: true,
            hintText: "Email",
            inputIcon: Icons.email,
            maxLines: 1,
            borderValidator: Colors.red,
            maxLength: 100,
          ),
          ButtonSecondary(
            title: 'Secondary',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
