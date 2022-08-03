import 'package:flutter/material.dart';
import 'package:flutter_modularization/commons/commons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.finnHubBackgroundDark,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            Images.iconFinnhub,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
