// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/values/colors.dart';

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
    this.companyname,
    this.orderId,
    this.shadowColor,
    this.type = 'suv',
  }) : super(key: key);
  final text;
  final orderId;
  final icon;
  final color;
  final cartype;
  final companyname;
  final dateTime;
  final ontap;
  final imageicon;
  final type;
  final shadowColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: ontap,
          child: Card(
            shadowColor: Colors.black,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'order id :',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(orderId),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          type == 'suv'
                              ? Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SvgPicture.asset(
                                      'assets/images/svgSuv.svg',
                                      height: 17,
                                      width: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : SvgPicture.asset(
                                  'assets/images/car_order.svg',
                                  height: 40,
                                  width: 40,
                                  // color: Colors.black,
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(companyname),
                                Text(cartype),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(dateTime),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
