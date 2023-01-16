// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/dropdown.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:klicks_app/values/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? cityvalue;
  String? mallValue;
  int _current = 0;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final List<String> imgList = [
    'assets/images/car_wash.jpg',
    'assets/images/logo1.png',
    'assets/images/car_wash.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Topbar(),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 4),
                        child: Text(
                          "Hello, Amal!",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      Text(
                        "Tuesday, January 3rd",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                ),
                                items: imgList.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          i,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 150,
                              child: Row(
                                children: [1, 2, 3]
                                    .map((i) => Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _current == i - 1
                                                  ? mainColor
                                                  : Colors.white),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Select Location",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      DropdownField(
                        imageIcon: 'assets/images/location.svg',
                        selectedvalue: cityvalue,
                        text: "Choose City",
                        items: items,
                        icon:
                            ImageIcon(AssetImage('assets/images/drop_arrow.png')),
                        onChange: (val) {
                          setState(() {
                            cityvalue = val;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Select Location",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      DropdownField(
                        imageIcon: 'assets/images/mall.svg',
                        selectedvalue: mallValue,
                        text: "Choose Mall",
                        items: items,
                        icon:
                            ImageIcon(AssetImage('assets/images/drop_arrow.png')),
                        onChange: (val) {
                          setState(() {
                            mallValue = val;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: LargeButton(
                          title: "Submit",
                          onPressed: () {
                            Navigator.pushNamed(context, 'select_car');
                          },
                          textcolor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
