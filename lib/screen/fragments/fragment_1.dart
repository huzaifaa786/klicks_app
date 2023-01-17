// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 40, right: 20),
        child: Column(
          children: [
            Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Image(
                    image: AssetImage(
                      'assets/images/logo1.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 110,
                  child: Text(
                    'Klicks Wash Service',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 95,
                  child: Text(
                    'Lorem ipsum dolor sit amet ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 75,
                  child: Text(
                    'consectetur. Elementum purus id',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
