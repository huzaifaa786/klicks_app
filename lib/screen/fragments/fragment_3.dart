// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          SvgPicture.asset('assets/images/frag3.svg'),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
