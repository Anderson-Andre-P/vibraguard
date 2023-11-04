// ignore_for_file: unused_element

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vibraguard/views/screens/navigation.dart';

import '../../shared/components/button_primary.dart';
import '../../shared/components/input_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your e-mail';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid e-mail';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Image.asset('assets/images/logo/logo.png'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                const Text('Please create account to access the application'),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputTextCustom(
                        keyboardType: TextInputType.text,
                        enabled: true,
                        hintText: "Enter your e-mail",
                        inputIcon: Icons.email,
                        maxLines: 1,
                        borderValidator: Colors.red,
                        maxLength: 100,
                        validator: _emailValidator,
                      ),
                      InputTextCustom(
                        keyboardType: TextInputType.text,
                        enabled: true,
                        hintText: "Enter your password",
                        inputIcon: Icons.lock,
                        maxLines: 1,
                        borderValidator: Colors.red,
                        maxLength: 100,
                        sufixIcon: _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        sufixOnPressed: () => setState(() {
                          _obscureText = !_obscureText;
                        }),
                        validator: _passwordValidator,
                      ),
                    ],
                  ),
                ),
                ButtonPrimary(
                  title: "Create account",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.success(
                          message: "Acepted credentials. Log in...",
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navigation()),
                      );
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message:
                              "Something went wrong. Please check your credentials and try again",
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
