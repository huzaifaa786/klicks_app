// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/values/colors.dart';

class CompanysDropdownField extends StatelessWidget {
  const CompanysDropdownField(
      {Key? key,
      this.controller,
      this.selectedvalue,
      this.text,
      this.icon,
      this.imageIcon,
      this.color = mainColor,
      this.items,
      this.maxlines = false,
      this.onChange,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;
  final List? items;
  final selectedvalue;
  final type;
  final text;
  final icon;
  final imageIcon;
  final color;
  final maxlines;
  final onChange;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  imageIcon,
                  height: 18,
                  width: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    color: hintColor,
                  ),
                ),
              ),
            ],
          ),
          items: items!
              .map((item) => DropdownMenuItem<Company>(
                    value: item,
                    child: Row(
                      children: [
                        item.image != null
                            ? CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    NetworkImage(item.image.toString()),
                                foregroundImage:
                                    NetworkImage(item.image.toString()),
                              )
                            : CircleAvatar(
                                radius: 15,
                                backgroundColor: mainColor,
                                child: Text('Company',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 7, color: Colors.white)),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            item.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          value: selectedvalue,
          onChanged: (value) {
            onChange(value);
          },
          buttonHeight: 50,
          buttonWidth: MediaQuery.of(context).size.width,
          buttonPadding: EdgeInsets.only(left: 12, right: 12),
          itemHeight: 40,
          icon: icon,
          buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey[300]!,
              )),
        ),
      ),
    );
  }
}
