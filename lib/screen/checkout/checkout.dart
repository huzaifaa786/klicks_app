// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/screen/checkout/payment_method.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
import 'package:klicks_app/static/checkout_input.dart';
import 'package:klicks_app/values/colors.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

enum payMethod { materCard, googlePay, applePay }

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool val = false;
  payMethod _site = payMethod.materCard;
  void toggleplan(payMethod value) {
    setState(() {
      _site = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
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
                            children: [Text('AED'), Text(' 45.00')],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
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
                          Text(
                            "Total Bill:",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text('41.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 20)),
                              Text('AED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 20))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 12),
                        child: Text(
                          "Payment method",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 21),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Text(
                          "Select your payment method ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14,color: hintColor),
                        ),
                      ),
                      PaymentMethod(
                        title: 'Mastercard',
                        image: "assets/images/masterCard.png",
                        groupvalue: _site,
                        value: payMethod.materCard,
                        onchaged: () {
                          toggleplan(payMethod.materCard);
                        },
                      ),
                      PaymentMethod(
                        title: 'Google Pay',
                        image: "assets/images/google.png",
                        value: payMethod.googlePay,
                        groupvalue: _site,
                        onchaged: () {
                          toggleplan(payMethod.googlePay);
                        },
                      ),
                      PaymentMethod(
                        title: 'Apple Pay',
                        image: "assets/images/apple.png",
                        groupvalue: _site,
                        value: payMethod.applePay,
                        onchaged: () {
                          toggleplan(payMethod.applePay);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
