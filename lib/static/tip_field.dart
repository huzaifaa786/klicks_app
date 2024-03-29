// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class TipInputField extends StatelessWidget {
  const TipInputField(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.onChange,
      this.imageIcon,
      this.validator,
      this.autovalidateMode,
      this.validate,
      this.icon,
      this.type = TextInputType.text,
      this.fontSize = 14.0,
      this.onpressed,
      this.onRmvPressed,
      this.color = White})
      : super(key: key);

  final controller;
  final validator;
  final bool? validate;
  final hint;
  final color;
  final type;
  final imageIcon;
  final icon;
  final text;
  final autovalidateMode;
  final maxlines;
  final onChange;
  final onpressed;final onRmvPressed;
  final fontSize;
  final enabled;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.1),
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
            fillColor: color,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 13, left: 8),
              child: Text("AED"),
            ),
            suffixIcon: InkWell(
              onTap: readOnly == false? onpressed :onRmvPressed,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: readOnly == false
                    ? InkWell(
                      onTap: onpressed,
                      child: Text(
                          LocaleKeys.Apply.tr(),
                          style: TextStyle(color: mainColor),
                        ),
                    )
                    : Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            ),
            contentPadding: EdgeInsets.only(left: 12),
            hintStyle: TextStyle(color: hintColor),
           enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          ),
          cursorColor: Colors.black,
          maxLines: maxlines == true ? null : 1,
        ),
      ),
    );
  }
}
