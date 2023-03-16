import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: fieldColor, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
