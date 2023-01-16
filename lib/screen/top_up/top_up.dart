import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/screen/checkout/payment_method.dart';
import 'package:klicks_app/static/box.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/values/colors.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

enum payMethod { materCard, googlePay, applePay }
class _TopUpState extends State<TopUp> {
  String? Selectedvalue = "AED 10";
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
        child: Column(
          children: [
            TitleTopbar(
              text: 'Top Up',
              ontap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Text(
                'Enter the amount of top up',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AED 10',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Box(
                    
                    title: 'AED 10',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 10';
                      });
                    },
                    selected: Selectedvalue == 'AED 10' ? true : false,
                  ),
                  Box(
                    title: 'AED 20',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 20';
                      });
                    },
                    selected: Selectedvalue == 'AED 20' ? true : false,
                  ),
                  Box(
                    title: 'AED 50',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 50';
                      });
                    },
                    selected: Selectedvalue == 'AED 50' ? true : false,
                  ),
                  Box(
                    title: 'AED 100',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 100';
                      });
                    },
                    selected: Selectedvalue == 'AED 100' ? true : false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(height: 12),
            ),
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
                SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: LargeButton(title: 'Add', onPressed: (){}),
              )  
          ],
        ),
      )),
    );
  }
}
