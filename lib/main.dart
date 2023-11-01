import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/viewmodel/assets_view_model.dart';
import 'package:vibraguard/views/screens/onboarding_screen.dart';

void main() {
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
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
