import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FragmentTwo extends StatefulWidget {
  const FragmentTwo({super.key});

  @override
  State<FragmentTwo> createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/images/backArrow.svg')),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                             onTap: () {},
                          child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                                            ),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child:SvgPicture.asset('assets/images/frag2.svg')),
            
            Padding(
              padding: const EdgeInsets.only(top: 13,right: 12),
              child: Text(
                ' Happy Clients',
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
