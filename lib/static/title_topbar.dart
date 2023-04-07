// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TitleTopbar extends StatelessWidget {
  const TitleTopbar({
    super.key,
    this.text,
    this.ontap,
  });
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20 ,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                 border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(45),
                    ),
                ),
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: 29,
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text('')
          ],
        ),
      ),
    );
  }
}
