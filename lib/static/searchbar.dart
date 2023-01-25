import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/values/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.icon,
      this.imageIcon,
      this.obscure = false,
      this.toggle,
      this.onChange,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;

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
    return TextFormField(
      style: const TextStyle(fontSize: 14),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Image(image: AssetImage(imageIcon)),
        suffixIcon: Image(image: AssetImage('assets/images/search-bar.png')),
        filled: true,
        fillColor: fieldColor,
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        contentPadding: const EdgeInsets.only(left: 3.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),

      //     (validate == true
      //         ? AutovalidateMode.always
    );
  }
}
