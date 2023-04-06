// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class ExtraListTile extends StatelessWidget {
  const ExtraListTile(
      {super.key, this.image, this.text, this.ontap, this.selected = false});
  final image;
  final text;
  final ontap;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(image),
                height: 25,
                width: 30,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.only(left: 6, top: 2, bottom: 2),
              decoration: BoxDecoration(
                border: Border.all(
                    color: selected == false ? mainColor : badgeGreen),
                color: selected == false ? White : White,
              ),
              child: Row(
                children: [
                  Icon(
                    selected == false ? Icons.add : Icons.check,
                    color: selected == false ? mainColor : badgeGreen,
                    size: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Text(
                      selected == false ? "Add" : "Added",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: selected == false ? mainColor : badgeGreen),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
