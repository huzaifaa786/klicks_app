// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod(
      {Key? key,
      this.value,
      this.groupvalue,
      this.onchaged,
      this.image,
      this.title})
      : super(
          key: key,
        );
  final value;
  final groupvalue;
  final onchaged;
  final image;
  final title;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onchaged,
      child: Container(
        margin: EdgeInsets.only(left: 34, top: 10),
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
                      Image(
                        image: AssetImage(widget.image),
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
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
