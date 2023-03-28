// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/intro/intro.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      final prefs = await SharedPreferences.getInstance();
      final String? authCheck = prefs.getString('api_token');
      if (authCheck == null) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new BottomNavScreen()));
      }
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    LoadingHelper.init();
    initscreen();
  }

  void initscreen() async {
    await Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      checkFirstSeen();
    });
  }

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
