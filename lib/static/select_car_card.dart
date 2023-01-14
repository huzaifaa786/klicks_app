// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class SelectCarCard extends StatelessWidget {
  const SelectCarCard({super.key, this.image, this.ontap, this.selected});
  final ontap;
  final image;
  final selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: fieldColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          selected == true
              ? Positioned(
                right: 12,
                top: 8,
                  child: Icon(
                  Icons.check_circle,
                  color: mainColor,
                ))
              : Positioned(child: Text(''))
        ],
      ),
    );
  }
}
