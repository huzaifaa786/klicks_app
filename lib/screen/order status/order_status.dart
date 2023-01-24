// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/static/badge.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
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
        padding: const EdgeInsets.only(left: 20, right: 20,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    'Order Detail',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset('assets/images/order.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CheckOutTile(
              title: 'Vehicle Type',
              discription: 'Sedan',
            ),
            CheckOutTile(
              title: 'Build Company:',
              discription: 'BMW ',
            ),
            CheckOutTile(
              title: 'Number Plate:',
              discription: 'WW 701',
            ),
            CheckOutTile(
              title: 'Parking Number:',
              discription: 'FA23',
            ),
            CheckOutTile(
              title: 'Mall',
              discription: 'Dubai Mall',
            ),
            CheckOutTile(
              title: 'Extras: ',
              discription: 'Wash seats as well',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Badge(
                  title: 'Complete',
                  color: badgeGreen,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
