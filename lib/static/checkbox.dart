// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class MCheckBox extends StatefulWidget {
  const MCheckBox(
      {Key? key, this.checkbox = false, required Function this.onchanged})
      : super(key: key);
  final checkbox;
  final onchanged;

  @override
  State<MCheckBox> createState() => _MCheckBoxState(onchanged);
}

class _MCheckBoxState extends State<MCheckBox> {
  final Function onchanged;

  _MCheckBoxState(Function this.onchanged) {}

  changeValue() {
    onchanged();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white,
      activeColor: mainColor,
      title: RichText(
        text: TextSpan(
          text: LocaleKeys.I_agree_to_terms_and_conditions.tr(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
      value: widget.checkbox,
      onChanged: (value) {
        changeValue();
      },
    );
  }
}
