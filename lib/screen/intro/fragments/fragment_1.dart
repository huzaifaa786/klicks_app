// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
          child: Container(
            padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/i1.png',
              ),
              height: 300,
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Wash your Car from our professional trained workers.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: 'OpenSans'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Enim fringilla et non in erat dolor.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,fontFamily: 'OpenSans'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
