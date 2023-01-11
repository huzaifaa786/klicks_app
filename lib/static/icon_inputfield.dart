// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/values/colors.dart';

class IconInputField extends StatelessWidget {
  const IconInputField(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.rounded = false,
      this.onChange,
      this.imageIcon,
      this.validator,
      this.autovalidateMode,
      this.validate,
      this.icon,
      this.type = TextInputType.text,
      this.fontSize = 17.0,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  final bool? validate;
  final hint;
  final type;
  final imageIcon;
  final icon;
  final text;
  final autovalidateMode;
  final maxlines;
  final rounded;
  final onChange;
  final onpressed;
  final fontSize;
  final enabled;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        controller: controller,
        style: TextStyle(fontSize: fontSize),
        keyboardType: type,
        validator: validator,
        // autovalidateMode: autovalidateMode ??
        //     (validate == true
        //         ? AutovalidateMode.always
        //         : AutovalidateMode.onUserInteraction),
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldColor,
          hintText: hint,
          hintStyle: TextStyle(color: hintColor),
          prefixIcon: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              imageIcon,
              height: 22,
              width: 22,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                rounded == true ? Radius.circular(45) : Radius.circular(6)),
            borderSide: BorderSide.none,
          ),
        ),
        cursorColor: Colors.black,
        maxLines: maxlines == true ? null : 1,
      ),
    );
  }
}