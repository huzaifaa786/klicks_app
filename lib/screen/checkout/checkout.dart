// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
import 'package:klicks_app/static/checkout_input.dart';
import 'package:klicks_app/values/colors.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SvgPicture.asset('assets/images/backArrow.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
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
              SizedBox(height: 12),
              CheckOutInputField(
                hint: 'Enter Coupon Code',
                onpressed: () {
                  setState(() {
                    val = !val;
                  });
                },
                readOnly: val,
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: White,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal"),
                        // Text("data"),
                        Row(
                          children: [
                            Text('AED'),
                            Text(' 45.00')
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("discount amount"),
                          Text("10%"),
                        ],
                      ),
                    ),
                    Divider(),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Bill:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                          Row(
                          children: [
                            Text('41.00',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                            Text('AED',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20))
                          ],
                        )
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
