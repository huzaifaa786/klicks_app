// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class Order extends StatelessWidget {
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
  }) : super(key: key);
  final text;
  final orderId;
  final icon;
  final color;
  final cartype;
  final price;
  final dateTime;
  final ontap;
  final imageicon;
  final type;
  final shadowColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: ontap,
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
                        type == 'suv'
                            ? Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.only(left: 4,right: 4),
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
                                padding: EdgeInsets.only(left: 4,right: 4),
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
                                  image: AssetImage('assets/images/car1.png'),
                                  height: 12,
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.order_id.tr() + ': ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: mainColor),
                                  ),
                                  Text(
                                    orderId,
                                    style: TextStyle(color: mainColor),
                                  ),
                                ],
                              ),
                              Text(cartype),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:4.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.grey[300],
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
                                  Text(dateTime,
                                      style: TextStyle(color: hintColor)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33),
                      child: Text(price + ' AED',
                          style: TextStyle(
                              color: hintColor, fontWeight: FontWeight.w600)),
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
