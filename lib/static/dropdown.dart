// ignore_for_file: unused_local_variable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class DropdownField extends StatelessWidget {
  const DropdownField(
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
  final List<String>? items;
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
              ImageIcon(AssetImage(imageIcon)),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
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
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedvalue,
          onChanged: (value) {
            onChange(value);
          },
          buttonHeight: 50,
          buttonWidth: MediaQuery.of(context).size.width * 0.9,
          buttonPadding: EdgeInsets.only(left: 10, right: 10),
          itemHeight: 40,
          icon: icon,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: fieldColor,
          ),
        ),
      ),
    );
  }
}
