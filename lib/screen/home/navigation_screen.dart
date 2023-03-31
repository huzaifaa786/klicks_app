// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/screen/main/main_screen.dart';
import 'package:klicks_app/screen/order_history/order_history.dart';
import 'package:klicks_app/screen/profile/profile.dart';
import 'package:klicks_app/screen/qrcode/qr_code.dart';
import 'package:klicks_app/values/colors.dart';
import 'dart:ui' as ui;
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key, this.selectedIndex}) : super(key: key);
  final selectedIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> with RouteAware {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // final GlobalKey<ChatsFragmentState> chatFragmentState = GlobalKey<ChatsFragmentState>();

  int _navigationMenuIndex = 0;
  bool _isScanning = false;

  void _scanQR() {
    setState(() {
      _isScanning = true;
    });
  }

  switchFragment(int index) {
    setState(() {
      _navigationMenuIndex = index;
    });
  }

  checkForSelectedIndex() {
    if (widget.selectedIndex != null) {
      _navigationMenuIndex = widget.selectedIndex;
    }
  }

  @override
  void initState() {
    checkForSelectedIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _fragments = [
      const MainScreen(),
      const OrderHistry(),
      const ProfileScreeen(),
    ];
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => QrCodeScreen())),
            child: Icon(
              Icons.qr_code,
              color: White,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            child: _fragments[_navigationMenuIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Material(
                      color: White,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/home.svg',
                                color: _navigationMenuIndex == 0
                                    ? mainColor
                                    : hintColor,
                              ),
                              // Icon(
                              //   Icons.home_filled,
                              //   color: _navigationMenuIndex == 0
                              //       ? mainColor
                              //       : hintColor,
                              // ),
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 0
                                      ? mainColor
                                      : hintColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(child: Container()),
                  Expanded(
                    child: Material(
                      color: White,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/order1.svg',
                                color: _navigationMenuIndex == 1
                                    ? mainColor
                                    : hintColor,
                              ),
                              Text(
                                "Orders",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 1
                                      ? mainColor
                                      : hintColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: White,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_outlined,
                                color: _navigationMenuIndex == 2
                                    ? mainColor
                                    : hintColor,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _navigationMenuIndex == 2
                                      ? mainColor
                                      : hintColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
