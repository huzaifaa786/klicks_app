// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

class FragmentOne extends StatefulWidget {
  const FragmentOne({super.key});

  @override
  State<FragmentOne> createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentOne> {
  void initState() {
    ScrollController scrollController = ScrollController();
    ScrollController scrollController2 = ScrollController();
    ScrollController scrollController3 = ScrollController();

    double pixels = 0.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 40, right: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'skip',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'),
                    ),
                  )
                ],
              ),
            ),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 70,
                  child: Text(
                    'Lorem ipsum dolor sit amet ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 70,
                  child: Text(
                    'consectetur. Elementum purus id',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),

            // ScrollIndicator(
            //   scrollController: ScrollController,
            //   width: 50,
            //   height: 5,
            //   indicatorWidth: 20,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.grey[300]),
            //   indicatorDecoration: BoxDecoration(
            //       color: Colors.deepOrange,
            //       borderRadius: BorderRadius.circular(10)),
            // ),
          ],
        ),
      )),
    );
  }
}
