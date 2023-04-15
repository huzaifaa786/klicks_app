// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class FragmentThree extends StatefulWidget {
  const FragmentThree({super.key, required this.controller});
  final PageController controller;
  @override
  State<FragmentThree> createState() => _FragmentThreeState();
}

class _FragmentThreeState extends State<FragmentThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  // padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
              image: AssetImage(
                'assets/images/ii3.png',
              ),
              height: MediaQuery.of(context).size.height * 0.35,
                      ),
                      Container(
              padding: EdgeInsets.only(top: 8,right: 8,left: 8,bottom : 2),
              child: Text(
                'A civilized method of car wash services in malls in which the car wash professional does not have to wait in hot weathers to provide the service .',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
                      ),
                      Container(
              padding: EdgeInsets.only(top: 12,right: 8,left: 8,bottom : 8),
              child: Text(
                'طريقة حضارية لخدمات غسيل السيارات في المولات حيث لا يضطر متخصص غسيل السياراتللانتظار في الأجواء الحارة لتقديم الخدمة',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
                      ),
                    ],
                  ),
                ),
            )));
  }
}
