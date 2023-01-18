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
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: SvgPicture.asset('assets/images/frag3.svg',height: 280)),
            Text(
              'Friendly Environemnt',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'OpenSans'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Lorem ipsum dolor sit amet ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
            ),
            Text(
              'consectetur. Elementum purus id',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
          ],
        ),
      )),
    );
  }
}
