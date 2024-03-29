// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/intro/intro.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/values/colors.dart';
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
      {
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
      backgroundColor: White,
      body: SafeArea(
        child: const Center(
          child: Image(
            image: AssetImage(
              'assets/images/mainLogo.png',
            ),
            height: 350,
            width: 350,
          ),
        ),
      ),
    );
  }
}
