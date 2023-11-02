import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/images/image_paths.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/views/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Coloque aqui qualquer inicialização necessária, se aplicável.

    // Após um período de tempo (por exemplo, 2 segundos), navegue para a tela de onboarding.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Personalize a cor de fundo da splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Coloque aqui a imagem ou widget da sua tela de splash
            Image.asset(ImagePaths.logo),
            const SizedBox(height: 16),
            Text(
              R.string.titleOfApp,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Personalize a cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
