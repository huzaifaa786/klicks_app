// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class LargeButton extends StatelessWidget {
  const LargeButton(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.text,
      this.textcolor,
      this.icon,
      this.buttonWidth = 0.8,
      this.sreenRatio = 0.9,
      this.color = mainColor})
      : super(key: key);

  final title;
  final onPressed;
  final sreenRatio;
  final color;
  final text;
  final textcolor;
  final icon;
  final buttonWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * sreenRatio,
      height: 50,
     
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shadowColor: mainColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
