import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class MBadge extends StatelessWidget {
  const MBadge({
    Key? key,
    @required this.title,
    this.color = badgeGreen,
    this.rounded = false,
    this.ontap,
    this.width = 0.4,
    this.paddingTop = 12.0,
    this.paddingBottom = 12.0,
    this.padTop = 30.0,
    this.textSize= 16.0,
  }) : super(key: key);
  final title;
  final color;
  final rounded;
  final ontap;
  final width;
  final paddingTop;
  final paddingBottom;
  final padTop;
  final textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop),
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: fieldColor, fontSize: textSize, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
