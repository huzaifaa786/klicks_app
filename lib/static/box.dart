import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/values/colors.dart';

class Box extends StatelessWidget {
  const Box({
    Key? key,
    @required this.title,
    this.ontap,
    this.selected,
  });
  final title;
  final ontap;
  final selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: selected == false ? Colors.white : mainColor,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color:selected == false? Colors.black:White, fontSize: 16, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
