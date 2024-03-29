// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class PPaymentMethod extends StatefulWidget {
  PPaymentMethod(
      {Key? key,
      this.value,
      this.groupvalue,
       this.onpress,
      this.onchaged,
      this.image,
      this.title})
      : super(
          key: key,
        );
  final value;
    final onpress;
  final groupvalue;
  final onchaged;
  final image;
  final title;
  @override
  State<PPaymentMethod> createState() => _PPaymentMethodState();
}

class _PPaymentMethodState extends State<PPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onchaged,
      child: Container(
        margin:context.locale.toString() == 'en'? EdgeInsets.only(left: 34):EdgeInsets.only(left: 12),
        padding: EdgeInsets.only(top: 7, bottom: 7),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Transform.translate(
                  offset: context.locale.toString() == 'en'? Offset(-25, 0) :Offset(0, 0),
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
