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
    this.ontap,
  }) : super(key: key);
  final title;
  final color;
  final rounded;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      padding: EdgeInsets.only(top: 4, bottom: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: fieldColor, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
