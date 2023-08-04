import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, 'current', (route) => false);
    });
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('assets/splash_screen.gif'),
      ),
    );
  }
}
