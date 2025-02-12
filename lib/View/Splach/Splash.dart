import 'package:fixit/View/Splach/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6A3BA8),
      body: Consumer<SplashController>(
        builder: (context, value, child) => Center(
          child: Lottie.asset('assets/logo.json', reverse: true),
        ),
      ),
    );
  }
}
