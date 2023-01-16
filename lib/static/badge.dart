import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/values/colors.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    @required this.title,
    this.color = badgeGreen,
    this.rounded = false,
  }) : super(key: key);
  final title;
  final color;
  final rounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 31, right: 31),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        title,
        style: TextStyle(
            color: fieldColor, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
