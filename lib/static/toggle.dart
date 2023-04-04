// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TwoSwitchToggle extends StatelessWidget {
  TwoSwitchToggle(
      {Key? key,
      @required this.onPressed,
      this.icon,
      this.switchToggle,
      this.initialLabelIndex = 0,
      this.totalSwitches = 2,
      this.sreenRatio = 0.9,
      this.text1,
      this.text2,
      // this.text3,
      this.color = colorgrey})
      : super(key: key);

  final onPressed;
  final sreenRatio;
  final color;
  final icon;
  final text1;
  final text2;
  // final text3;
  final initialLabelIndex;
  final totalSwitches;
  final switchToggle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleSwitch(
        minWidth: MediaQuery.of(context).size.width * 0.42,
        minHeight: 65.0,
        cornerRadius: 10.0,
        activeBgColors: const [
          [mainColor],
          [mainColor],
          [mainColor]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.blue.withOpacity(0.2),
        inactiveFgColor: Colors.black,
        initialLabelIndex: initialLabelIndex,
        totalSwitches: totalSwitches,
        labels: [text1, text2],
        radiusStyle: true,
        // ignore: prefer_const_literals_to_create_immutables
        // customTextStyles: [
        //   TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
        //   TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
        // ],
        onToggle: (index) {
          switchToggle(index);
        },
      ),
    );
  }
}
