// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class SearchMethod extends StatefulWidget {
  SearchMethod(
      {Key? key,
      this.value,
      this.groupvalue,
      this.onpress,
      this.onchaged,
      this.color,
      this.title})
      : super(
          key: key,
        );
  final value;
  final onpress;
  final groupvalue;
  final onchaged;
  final color;
  final title;
  @override
  State<SearchMethod> createState() => _SearchMethodState();
}

class _SearchMethodState extends State<SearchMethod> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onchaged,
      child: Container(
        margin: EdgeInsets.only(left: 34),
        padding: EdgeInsets.only(top: 7, bottom: 7),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Transform.translate(
                  offset: Offset(-25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: widget.color),
                      )
                    ],
                  ),
                ),
                trailing: Transform.scale(
                    scale: 1.2,
                    child: Radio(
                        value: widget.value.toString(),
                        groupValue: widget.groupvalue.toString(),
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => mainColor),
                        onChanged: (value) {
                          widget.onchaged();
                        })),
                dense: true,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
