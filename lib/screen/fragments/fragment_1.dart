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
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/logo1.png',
              ),
              height: 300,
            ),
            Text(
              'Klicks Wash Service',
              style: TextStyle(
                  fontSize: 24,
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
                    fontFamily: 'OpenSans'),
              ),
            ),
            Text(
              'consectetur. Elementum purus id',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
            ),
          ],
        ),
      )),
    );
  }
}
