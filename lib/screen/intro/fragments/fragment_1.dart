// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class FragmentOne extends StatefulWidget {
  const FragmentOne({super.key, required this.controller});
  final PageController controller;

  @override
  State<FragmentOne> createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/mainLogo.png',
              ),
              height: 300,
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Klick wash is a platform that provides a convenient car wash experience while you are enjoying your stay at your preferred mall . ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'كليك ووش هي منصة توفر تجربة غسيل سيارات مريحة أثناء قضاء وقتك في المركزالتجاري المفضل لديك',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
