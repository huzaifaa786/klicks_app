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
      this.ontap,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;

  final obscure;
  final hint;
  final type;
  final text;
  final icon;
  final ontap;
  final imageIcon;
  final toggle;
  final onChange;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 14),
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: Image(image: AssetImage(imageIcon)),
        suffixIcon: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset("assets/images/search_bar.svg",
                    color: White, height: 18, width: 18)),
          ),
        ),
        filled: true,
        fillColor: White,
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        contentPadding: const EdgeInsets.only(left: 3.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),

      //     (validate == true
      //         ? AutovalidateMode.always
    );
  }
}
