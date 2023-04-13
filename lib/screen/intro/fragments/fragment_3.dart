// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              'assets/images/ii1.jpg',
            ),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              'Wash your Car from our professional trained workers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              'A civilized method of car wash services in malls in which the car wash professional does not have to wait in hot weathers to provide the service .',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              'طريقة حضارية لخدمات غسيل السيارات في المولات حيث لا يضطر متخصص غسيل السياراتللانتظار في الأجواء الحارة لتقديم الخدمة',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
            ),
          ),
        ],
      ),
    )));
  }
}
