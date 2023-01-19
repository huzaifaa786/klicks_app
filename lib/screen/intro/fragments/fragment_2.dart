import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FragmentTwo extends StatefulWidget {
  const FragmentTwo({super.key, required this.controller});
  final PageController controller;
  @override
  State<FragmentTwo> createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/frag2.svg',
              height: 280,
            ),
            Text(
              ' Happy Clients',
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
            Text(
              ' pellentesque',
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
