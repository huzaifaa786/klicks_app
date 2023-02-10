// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/screen/select_car/select_car.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/citydropdown.dart';
import 'package:klicks_app/static/company.dart';
import 'package:klicks_app/static/mallsdropdown.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:klicks_app/values/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> cities = [];
  List<dynamic> malls = [];
  List<dynamic> companys = [];
  String? name;
  City? cityvalue;
  Mall? mallValue;
  Company? companyValue;
  getcity() async {
    cities = [];
    var mcities = await CityApi.getcities();
    setState(() {
      cities = mcities;
    });
  }

  getmalls(id) async {
    var mMalls = await CityApi.getmall(id);
    setState(() {
      mallValue = null;
      malls = mMalls;
    });
  }

  getcomapnys(id) async {
    var mCompanys = await CityApi.getcompany(id);
    setState(() {
      companyValue = null;
      companys = mCompanys;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getcity();
    });
  }

  int _current = 0;

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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                      CityDropdownField(
                        imageIcon: 'assets/images/location.svg',
                        text: "Choose City",
                        selectedvalue: cityvalue,
                        items: cities.toList(),
                        icon: ImageIcon(
                            AssetImage('assets/images/drop_arrow.png')),
                        onChange: (value) {
                          setState(() {
                            cityvalue = value;
                          });
                          getmalls(value.id);
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
                      MallsDropdownField(
                        imageIcon: 'assets/images/mall.svg',
                        text: "Choose Mall",
                        selectedvalue: mallValue,
                        items: malls,
                        icon: ImageIcon(
                            AssetImage('assets/images/drop_arrow.png')),
                        onChange: (value) {
                          setState(() {
                            mallValue = value;
                          });
                          getcomapnys(value.id);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Select Company",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      CompanysDropdownField(
                        imageIcon: 'assets/images/mall.svg',
                        text: "Choose Company",
                        selectedvalue: companyValue,
                        items: companys,
                        icon: ImageIcon(
                            AssetImage('assets/images/drop_arrow.png')),
                        onChange: (value) {
                          setState(() {
                            companyValue = value;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: LargeButton(
                          title: "Submit",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarSelect(
                                      mall: mallValue!,
                                          company: companyValue!,
                                        )));
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
