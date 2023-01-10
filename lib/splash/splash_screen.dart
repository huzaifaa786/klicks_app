// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Center(
          child: Image(
            image: AssetImage(
              'assets/images/logo1.png',
            ),
            height: 350,
            width: 350,
          ),
        ),
      ),
    );
  }
}
