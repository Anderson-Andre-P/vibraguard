import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/screens/auth/sign_up_screen.dart';
import 'package:vibraguard/views/screens/navigation.dart';

import '../../../core/helpers/images/image_paths.dart';
import '../../shared/components/button_primary.dart';
import '../../shared/components/input_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return R.string.emptyEmail;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return R.string.invalidEmail;
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return R.string.emptyPassword;
    }
    if (!RegExp(r'^.{4,20}$').hasMatch(value)) {
      return R.string.invalidPassword;
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
                Image.asset(ImagePaths.logo),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  R.string.loginTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                Text(R.string.loginSubTitle),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      InputTextCustom(
                        keyboardType: TextInputType.emailAddress,
                        enabled: true,
                        hintText: R.string.emailTitle,
                        inputIcon: Icons.email,
                        maxLines: 1,
                        borderValidator: Colors.red,
                        maxLength: 100,
                        validator: _emailValidator,
                      ),
                      InputTextCustom(
                        keyboardType: TextInputType.text,
                        enabled: true,
                        hintText: R.string.passwordTitle,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Implement forgot password
                          },
                          child: Text(
                            R.string.forgotPassword,
                            style: TextStyle(
                                color: R.colors.lightPrimaryColor,
                                fontSize: R.fontSize.fs12,
                                fontFamily: R.fontFamily.secondaryFont,
                                fontWeight: R.fontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonPrimary(
                  title: R.string.loginButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: R.string.validCredentials,
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
                        CustomSnackBar.error(
                          message: R.string.invalidCredentials,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: R.string.dontHaveAccount,
                    style: TextStyle(color: R.colors.lightCommonTextColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: R.string.signupButton,
                        style: TextStyle(color: R.colors.lightPrimaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
