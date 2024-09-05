import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AuthScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Assets.img.background.splash.image()),
          Center(
            child: Assets.img.icons.logo.svg(width: 100),
          )
        ],
      ),
    );
  }
}
