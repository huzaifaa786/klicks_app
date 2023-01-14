// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/values/colors.dart';

class InputFieldPassword extends StatelessWidget {
  const InputFieldPassword(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.icon,
      this.imageIcon,
      this.obscure = false,
      this.toggle,
      this.onChange,
      this.validator,
      this.validate,
      this.autovalidateMode,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  final bool? validate;
  final autovalidateMode;
  final obscure;
  final hint;
  final type;
  final text;
  final icon;
  final imageIcon;
  final toggle;
  final onChange;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: const TextStyle(fontSize: 14),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              imageIcon,
              height: 22,
              width: 22,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              toggle();
            },
            child: Icon(
                obscure ? Icons.visibility_off_outlined: Icons.visibility_outlined ,
                color: Colors.black,
              ),
          ),
            
          filled: true,
          fillColor: fieldColor,
          hintText: hint,
          hintStyle: TextStyle(color: hintColor),
          contentPadding: const EdgeInsets.only(left: 3.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: type,
        cursorColor: Colors.black,
        obscureText: obscure,
        maxLines: 1,
        validator: validator,
        // autovalidateMode: autovalidateMode ??
        //     (validate == true
        //         ? AutovalidateMode.always
        //         : AutovalidateMode.onUserInteraction),
      ),
    );
  }
}
