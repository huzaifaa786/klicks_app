// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:klicks_app/screen/edit_profile.dart/edit_profile.dart';
import 'package:klicks_app/screen/home/bottom_navi.dart';
import 'package:klicks_app/screen/main/main_screen.dart';
import 'package:klicks_app/screen/order%20status/order_status.dart';
import 'package:klicks_app/screen/profile/profile.dart';

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
      const OrderStatus(),
      const ProfileScreeen(),
    ];
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: _fragments[_navigationMenuIndex],
        ),
        bottomNavigationBar: ClipRRect(
            child: BottomNavigation(_navigationMenuIndex, switchFragment)),
      ),
    );
  }
}
