// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/viewmodel/assets/assets_view_model.dart';
import 'package:vibraguard/viewmodel/users/user_view_model.dart';
import 'package:vibraguard/viewmodel/work_orders/work_order_view_model.dart';
import 'package:vibraguard/views/screens/auth/sign_in_screen.dart';
import 'package:vibraguard/views/screens/onboarding_screen.dart';
import 'package:vibraguard/views/shared/theme/app_theme.dart';
import 'package:vibraguard/views/shared/theme/config.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstOpen = prefs.getBool('firstOpen') ?? true;
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (isFirstOpen) {
    await prefs.setBool('firstOpen', false);
  }

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AssetsViewModel>(
          create: (_) => AssetsViewModel(),
        ),
        ChangeNotifierProvider<UsersViewModel>(
          create: (_) => UsersViewModel(),
        ),
        ChangeNotifierProvider<WorkOrdersViewModel>(
          create: (_) => WorkOrdersViewModel(),
        ),
      ],
      child: MainApp(
        isFirstOpen: isFirstOpen,
        prefs: prefs,
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  final bool isFirstOpen;

  const MainApp(
      {required this.isFirstOpen, Key? key, required SharedPreferences prefs})
      : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: R.string.titleOfApp,
      theme: appThemeLight(),
      darkTheme: appThemeLight(),
      themeMode: currentTheme.currentTheme(),
      debugShowCheckedModeBanner: false,
      home:
          widget.isFirstOpen ? const OnboardingScreen() : const SignInScreen(),
    );
  }
}
