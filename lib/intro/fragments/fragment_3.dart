// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FragmentThree extends StatefulWidget {
  const FragmentThree({super.key});

  @override
  State<FragmentThree> createState() => _FragmentThreeState();
}

class _FragmentThreeState extends State<FragmentThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 25),
                    child: SvgPicture.asset('assets/images/backArrow.svg'),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 90, right: 30),
              child: SvgPicture.asset('assets/images/frag3.svg')),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 13, right: 12),
            child: Text(
              'Friendly Environemnt',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'OpenSans'),
            ),
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
          Container(
            child: Row(children: [


              
            ],),
          )
        ],
      )),
    );
  }
}
