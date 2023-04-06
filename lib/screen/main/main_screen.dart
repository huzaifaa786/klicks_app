// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/api/notification_api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/screen/select_car/select_car.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/citydropdown.dart';
import 'package:klicks_app/static/mainText.dart';
import 'package:klicks_app/static/mallsdropdown.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    LoadingHelper.show();
    var mCompanys = await CityApi.getcompany(id);
    setState(() {
      companyValue = null;
      companys = mCompanys;
      companyValue = companys[0];
      LoadingHelper.dismiss();
    });
  }

  User? user;
  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authCheck = prefs.getString('api_token');
    if (authCheck != null) {
      var muser = await AuthApi.getuser();
      setState(() {
        user = muser;
      });
    }
  }

  DateTime? now;
  String? monthName;
  String? weekdayName;

  List<String> weekdays = [
    '',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<String> monthNames = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  date() {
    setState(() {});
    now = DateTime.now();
    monthName = monthNames[now!.month];
    weekdayName = weekdays[now!.weekday];
  }

    bool? checkNoti = false;

  checkNotifications() async {
    var mcheckNotification = await NotificationApi.CheckNotications();
    setState(() {
      checkNoti = mcheckNotification;
      print(checkNoti);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getuser();
      date();
      checkNotifications();
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
            Topbar(
              checkNewNoti: checkNoti,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      user != null
                          ? Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                LocaleKeys.Hello.tr() + ", " + user!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black.withOpacity(0.8),
                                    fontFamily: 'Poppins'),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                LocaleKeys.Hello.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black.withOpacity(0.8),
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                      Text(
                        weekdayName != null
                            ? weekdayName! +
                                ', ' +
                                monthName! +
                                ' ' +
                                now!.day.toString()
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Poppins'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
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
                          child: MainScreenText(
                            image: 'assets/images/locationIcon.svg',
                            text: LocaleKeys.Select_Location.tr(),
                          )),
                      CityDropdownField(
                        imageIcon: 'assets/images/location.svg',
                        text: LocaleKeys.Choose_City.tr(),
                        selectedvalue: cityvalue,
                        items: cities.toList(),
                        icon: ImageIcon(
                            AssetImage('assets/images/drop_arrow.png')),
                        onChange: (value) {
                          setState(() {
                            cityvalue = value;
                            malls = [];
                            companys = [];
                          });
                          getmalls(value.id);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: MainScreenText(
                          image: 'assets/images/mallIcon.svg',
                          text: LocaleKeys.Select_Mall.tr(),
                        ),
                      ),
                      MallsDropdownField(
                        imageIcon: 'assets/images/mall.svg',
                        text: LocaleKeys.Choose_Mall.tr(),
                        selectedvalue: mallValue,
                        items: malls,
                        icon: ImageIcon(
                            AssetImage('assets/images/drop_arrow.png')),
                        onChange: (value) {
                          setState(() {
                            mallValue = value;
                            companys = [];
                          });
                          getcomapnys(value.id);
                        },
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 15.0),
                      //   child: MainScreenText(
                      //     image: 'assets/images/mallIcon.svg',
                      //     text: LocaleKeys.Select_Company.tr(),
                      //   ),
                      // ),
                      // CompanysDropdownField(
                      //   imageIcon: 'assets/images/mall.svg',
                      //   text: LocaleKeys.Choose_Company.tr(),
                      //   selectedvalue: companyValue,
                      //   items: companys,
                      //   icon: ImageIcon(
                      //       AssetImage('assets/images/drop_arrow.png')),
                      //   onChange: (value) {
                      //     setState(() {
                      //       companyValue = value;
                      //     });
                      //   },
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 40),
                        child: LargeButton(
                          title: LocaleKeys.Submit.tr(),
                          onPressed: () {
                            if (cityvalue != null && mallValue != null) {
                              if (companyValue != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CarSelect(
                                              mall: mallValue!,
                                              company: companyValue!,
                                              city: cityvalue!,
                                              // uid: user!.id!,
                                            )));
                              } else {
                                print('');
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "You can't perfom any function until you select the your desire data");
                            }
                          },
                          textcolor: Colors.white,
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
