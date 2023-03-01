import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:klicks_app/values/colors.dart';

class LoadingHelper {
  static bool absorbClick = false;
  static var onChangeAbsorbClick;

  static show() {
    absorbClick = true;
    onChangeAbsorbClick();
    EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.none,
      indicator: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
      ),
    );
  }

  static dismiss() {
    absorbClick = false;
    onChangeAbsorbClick();
    EasyLoading.dismiss();
  }

  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.blue
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    // ..customAnimation = customAnimation();
  }
}
