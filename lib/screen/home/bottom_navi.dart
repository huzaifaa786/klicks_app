
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

// ignore: no_leading_underscores_for_local_identifiers
Widget BottomNavigation(_navigationMenuIndex, onTapBottomMenu) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: White,
    // fixedColor: secondaryColor,
    unselectedItemColor: mainColor,
    selectedIconTheme: const IconThemeData(size: 30),
    selectedFontSize: 0,
    unselectedFontSize: 0,
    currentIndex: _navigationMenuIndex,
    onTap: (int index) {
      onTapBottomMenu(index);
    },
    items: const [
      BottomNavigationBarItem(
        label: '',
        icon: Icon(
          Icons.home_outlined,
          size: 30,
          color: hintColor,
        ),
        activeIcon: Icon(
          Icons.home_outlined,
          size: 20,
          color: mainColor,
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Icon(
          Icons.book,
          size: 20,
          color: hintColor,
        ),
        activeIcon: Icon(
          Icons.book,
          size: 20,
          color: mainColor,
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Icon(
          Icons.account_box_outlined,
          size: 30,
          color: hintColor,
        ),
        activeIcon: Icon(
          Icons.account_box_outlined,
          size: 25,
          color: mainColor,
        ),
      ),
    ],
  );
}
