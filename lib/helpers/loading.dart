import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  static bool absorbClick = false;
  static var onChangeAbsorbClick;

  static show() {
    absorbClick = true;
    onChangeAbsorbClick();
    EasyLoading.show();
  }

  static dismiss() {
    absorbClick = false;
    onChangeAbsorbClick();
    EasyLoading.dismiss();
  }

  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.blue
      ..textColor = Colors.blue
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[];
  }
}
