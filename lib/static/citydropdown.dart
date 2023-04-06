// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/model/City.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:klicks_app/values/colors.dart';

class CityDropdownField extends StatelessWidget {
  const CityDropdownField(
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
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
                      fontSize: 13,
                      color: hintColor,
                    ),
                  ),
                ),
              ],
            ),
            items: items!
                .map((item) => DropdownMenuItem<City>(
                      value: item,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top :2.0,bottom: 2),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: item.image != null
                                      ? DecorationImage(
                                          image:
                                              CachedNetworkImageProvider(item.image.toString()),
                                          fit: BoxFit.contain)
                                      : DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo1.png'),
                                          fit: BoxFit.contain),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
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
      ),
    );
  }
}
