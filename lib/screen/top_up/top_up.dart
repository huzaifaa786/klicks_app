import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/strip.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/checkout/payment_method.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/static/box.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/inputfield.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TopUp extends StatefulWidget {
  @override
  State<TopUp> createState() => _TopUpState();
}

enum payMethod { materCard, googlePay, applePay }

class _TopUpState extends State<TopUp> {
  String? Selectedvalue = "10";
  payMethod _site = payMethod.materCard;
  void toggleplan(payMethod value) {
    setState(() {
      _site = value;
    });
  }

  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     print(widget.user_id);
  //   });
  //   super.initState();
  // }

  paayment() async {
    LoadingHelper.show();
    var data = await StripeApi.paymentIntent(Selectedvalue);
    data = jsonDecode(data.toString());
    print('sdsa');
    print(data['paymentIntent']);
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['paymentIntent'],
          merchantDisplayName: 'Klicks',
          billingDetails: BillingDetails(
              address: Address(
                  country: "AE",
                  city: '',
                  line1: '',
                  line2: '',
                  postalCode: '',
                  state: '')),
          // Customer params
          customerId: data['customer'].toString(),
          customerEphemeralKeySecret: data['ephemeralKey'].toString(),
          // Extra params
          applePay: PaymentSheetApplePay(merchantCountryCode: 'AE'),
          googlePay: PaymentSheetGooglePay(merchantCountryCode: 'AE'),
          style: ThemeMode.dark,
          customFlow: true
          // billingDetails: billingDetails,
          ),
    );
    LoadingHelper.dismiss();
    confirmPayment();
  }

  Future<bool> confirmPayment() async {
    print("Asdfasdfsdfasfd");

    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      print('object');

      Fluttertoast.showToast(msg: 'Payment succesfully completed');
      addbalance();
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        print('adsfasdfasdfadsfadsfa');
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
        return false;
      }
    }
  }

  addbalance() {
    StripeApi.addbalance(Selectedvalue);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: 'Top Up',
            ontap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.89,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 12),
                      child: Text(
                        'Enter the amount of top up',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          Enteramount();
                        },
                        child: Container(
                            height: 105,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AED ' + Selectedvalue!,
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      ),
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
                                Selectedvalue = '10';
                              });
                            },
                            selected: Selectedvalue == '10' ? true : false,
                          ),
                          Box(
                            title: 'AED 20',
                            ontap: () {
                              setState(() {
                                Selectedvalue = '20';
                              });
                            },
                            selected: Selectedvalue == '20' ? true : false,
                          ),
                          Box(
                            title: 'AED 50',
                            ontap: () {
                              setState(() {
                                Selectedvalue = '50';
                              });
                            },
                            selected: Selectedvalue == '50' ? true : false,
                          ),
                          Box(
                            title: 'AED 100',
                            ontap: () {
                              setState(() {
                                Selectedvalue = '100';
                              });
                            },
                            selected: Selectedvalue == '100' ? true : false,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(height: 12),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   color: White,
                      //   borderRadius: BorderRadius.all(Radius.circular(6)),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey.withOpacity(0.1),
                      //       spreadRadius: 1,
                      //       blurRadius: 10,
                      //       offset: Offset(0, 3),
                      //     ),
                      //   ],
                      // ),
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
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: hintColor),
                            ),
                          ),
                          PPaymentMethod(
                            title: 'Mastercard',
                            image: "assets/images/masterCard.png",
                            groupvalue: _site,
                            value: payMethod.materCard,
                            onchaged: () {
                              toggleplan(payMethod.materCard);
                            },
                          ),
                          PPaymentMethod(
                            title: 'Google Pay',
                            image: "assets/images/google.png",
                            value: payMethod.googlePay,
                            groupvalue: _site,
                            onchaged: () {
                              toggleplan(payMethod.googlePay);
                            },
                          ),
                          PPaymentMethod(
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                LargeButton(
                    title: 'Add',
                    onPressed: () {
                      paayment();
                    })
              ],
            ),
          ),
        ],
      )),
    );
  }

  Enteramount() {
    TextEditingController amount = TextEditingController();

    Alert(
        context: context,
        title: "Enter your amount",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 6),
            Text(
              "Enter Amount",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: 'Enter your amount',
              controller: amount,
              type: TextInputType.number,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: mainColor,
            onPressed: () async {
              setState(() {
                Selectedvalue = amount.text;
              });
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ]).show();
  }
}
