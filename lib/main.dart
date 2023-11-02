// ignore_for_file: use_build_context_synchronously, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibraguard/viewmodel/assets_view_model.dart';
import 'package:vibraguard/views/screens/home_screen.dart';
import 'package:vibraguard/views/screens/onboarding_screen.dart';
import 'package:vibraguard/views/screens/test_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstOpen = prefs.getBool('firstOpen') ?? true;
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AssetsViewModel>(
          create: (_) => AssetsViewModel(),
        ),
        // ChangeNotifierProvider<CompaniesViewModel>(
        //   create: (_) => CompaniesViewModel(),
        // ),
        // ChangeNotifierProvider<UnitsViewModel>(
        //   create: (_) => UnitsViewModel(),
        // ),
        // ChangeNotifierProvider<UsersViewModel>(
        //   create: (_) => UsersViewModel(),
        // ),
        // ChangeNotifierProvider<WorkOrdersViewModel>(
        //   create: (_) => WorkOrdersViewModel(),
        // ),
      ],
      child: MaterialApp(
        home: isFirstOpen
            ? const OnboardingScreen()
            : const HomeScreen(
                id: 1,
              ),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen(
      id: 1,
    );
  }
}
