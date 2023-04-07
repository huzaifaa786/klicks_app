// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/static/badge.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class Order extends StatefulWidget {
  const Order({
    Key? key,
    this.text,
    this.icon,
    this.color,
    this.imageicon,
    this.ontap,
    this.cartype,
    this.dateTime,
    this.price,
    this.orderId,
    this.shadowColor,
    this.type = 'suv',
    this.status = 1,
  }) : super(key: key);
  final text;
  final orderId;
  final icon;
  final color;
  final cartype;
  final status;
  final price;
  final dateTime;
  final ontap;
  final imageicon;
  final type;
  final shadowColor;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    super.initState();
    print(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: widget.ontap,
        child: Card(
          elevation: 3,
          shadowColor: grey,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        widget.type == 'suv'
                            ? Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.only(left: 4, right: 4),
                                decoration: BoxDecoration(
                                  color: White,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Image(
                                  image: AssetImage('assets/images/car2.png'),
                                  height: 12,
                                ),
                              )
                            : Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.only(left: 4, right: 4),
                                decoration: BoxDecoration(
                                  color: White,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Image(
                                  image: AssetImage('assets/images/sedan1.png'),
                                  height: 12,
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Directionality(
                                textDirection: context.locale.toString() == 'en'
                                    ? ui.TextDirection.ltr
                                    : ui.TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.order_id.tr() + ': ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: mainColor),
                                    ),
                                    Text(
                                      widget.orderId,
                                      style: TextStyle(color: mainColor),
                                    ),
                                  ],
                                ),
                              ),
                              Text(widget.cartype),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SvgPicture.asset(
                                          'assets/images/calender.svg',
                                          height: 10,
                                          width: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(widget.dateTime,
                                      style: TextStyle(color: hintColor)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          widget.status == 3
                              ? MBadge(
                                  title: LocaleKeys.Completed.tr(),
                                  color: Colors.green,
                                  ontap: () {},
                                  paddingBottom: 4.0,
                                  paddingTop: 4.0,
                                  padTop: 0.0,
                                  textSize: 8.0,
                                  width: 0.2,
                                )
                              : widget.status == 2
                                  ? MBadge(
                                      title: LocaleKeys.Rejected.tr(),
                                      color: Colors.red,
                                      ontap: () {},
                                      paddingBottom: 4.0,
                                      paddingTop: 4.0,
                                      padTop: 0.0,
                                      textSize: 8.0,
                                      width: 0.2,
                                    )
                                  : MBadge(
                                      title: LocaleKeys.In_progress.tr(),
                                      color: InprocessColor,
                                      ontap: () {},
                                      paddingBottom: 4.0,
                                      paddingTop: 4.0,
                                      textSize: 8.0,
                                      width: 0.2,
                                      padTop: 0.0,
                                    ),
                          Text(widget.price + ' AED',
                              style: TextStyle(
                                  color: hintColor,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
