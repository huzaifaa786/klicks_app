// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/static/badge.dart';
import 'package:klicks_app/values/colors.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      'Order Detail',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SvgPicture.asset('assets/images/order.svg'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 20, right: 20),
              child: SizedBox(
                height: 371,
                width: MediaQuery.of(context).size.width,
                child: Card(
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  'Order ID:  453 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: Text(
                                  'data : jan 13 2023',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 20),
                              child: Text(
                                'Mall ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                'Dubai Mall',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Company ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                'BMW',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Floor ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                '3rd',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Number Plate ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                'FA23',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Parking Number ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                '23',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Car Type',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 20),
                              child: Text(
                                'Sweden',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 20),
                              child: Text(
                                'Order status',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 8),
                              child: Badge(
                                title: 'Complete',
                                color: badgeGreen,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
