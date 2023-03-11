// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/order.dart';
import 'package:klicks_app/api/strip.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/Account.dart';
import 'package:klicks_app/screen/checkout/payment_method.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
import 'package:klicks_app/static/checkout_input.dart';
import 'package:klicks_app/static/tip_field.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, @required this.data});
  final SelectedCarInfo? data;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

enum PayMethod { materCard, googlePay, applePay, walletpay }

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool val = false;
  bool val1 = false;
  bool tip = false;

  TextEditingController tipcontroller = TextEditingController();

  PayMethod _site = PayMethod.materCard;
  void toggleplan(PayMethod value) {
    setState(() {
      _site = value;
    });
  }

  int? total;

  balance() {
    StripeApi.subtract(total);
  }

  walletpayment() {
    if (account!.balance! <= total!) {
      Fluttertoast.showToast(msg: 'wallet amount is less then order amount');
    } else {
      orderPlaced();
      balance();
    }
  }

  paayment() async {
    LoadingHelper.show();

    var data = await StripeApi.paymentIntent(
      widget.data!.price,
    );
    data = jsonDecode(data.toString());
    print('sdsa');
    print(data['paymentIntent']);
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['paymentIntent'],
          merchantDisplayName: 'Klicks',
          // Customer params
          customerId: data['customer'].toString(),
          customerEphemeralKeySecret: data['ephemeralKey'].toString(),
          // Extra params
          applePay: PaymentSheetApplePay(merchantCountryCode: 'GBP'),
          googlePay: PaymentSheetGooglePay(merchantCountryCode: 'GBP'),
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
      orderPlaced();
      Fluttertoast.showToast(msg: 'Payment succesfully completed');
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

  orderPlaced() async {
    if (tipcontroller.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await OrderApi.placeorder(
        tipcontroller.text,
        widget.data!.selectedcartype,
        widget.data!.company!.company_id,
        widget.data!.floorNumber,
        widget.data!.mall!.id,
        widget.data!.plateNumber,
        widget.data!.parkingNumber,
        widget.data!.price,
        widget.data!.extraService,
        widget.data!.uid,
        widget.data!.cityId,
      )) Navigator.pushNamed(context, 'booking_confirm');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
  }

  int? Addtip = 0;

  Account? account;
  getbalance() async {
    var mbalance = await StripeApi.balance();
    setState(() {
      account = mbalance;
    });
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getbalance();
    });
    total = widget.data!.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
        child: Column(
          children: [
            TitleTopbar(
              text: 'Checkout',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.89,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.only(right: 2, left: 1),
                        padding: EdgeInsets.only(right: 12,left: 12,top: 16,bottom: 16),
                        decoration: BoxDecoration(
                          color: White,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CheckOutTile(
                              title: LocaleKeys.Vehicle_Type.tr() + ':',
                              discription: widget.data!.selectedcartype,
                              image: 'assets/images/vehicleType.svg',
                            ),
                            CheckOutTile(
                              title: LocaleKeys.Build_Company.tr() + ':',
                              discription: widget.data!.company!.name,
                              image: 'assets/images/providerCompany.svg',
                            ),
                            CheckOutTile(
                              title: LocaleKeys.Number_Plate.tr() + ':',
                              discription: widget.data!.plateNumber,
                              image: 'assets/images/numberPlate.svg',
                            ),
                            CheckOutTile(
                              title: LocaleKeys.Parking_Number.tr() + ':',
                              discription: widget.data!.parkingNumber,
                              image: 'assets/images/parkingNumber.svg'
                            ),
                            CheckOutTile(
                              title: LocaleKeys.Mall.tr() + ':',
                              discription: widget.data!.mall!.name,
                              image: 'assets/images/mallCheckout.svg'
                            ),
                             CheckOutTile(
                              title: LocaleKeys.Floor_Number.tr() + ':',
                              discription: widget.data!.floorNumber!,
                              image: 'assets/images/floorNumberCheck.svg'
                            ),
                            CheckOutTile(
                              title: LocaleKeys.Extras.tr() + ':',
                              discription: widget.data!.extraService == null
                                  ? 'No, Extra service added'
                                  : widget.data!.extraService!.length
                                          .toString() +
                                      ' ' +
                                      'Extra service added',
                                      image: 'assets/images/Extras.svg'
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      CheckOutInputField(
                        hint: LocaleKeys.Enter_Coupon_Code.tr(),
                        onpressed: () {
                          setState(() {
                            val = !val;
                          });
                        },
                        readOnly: val,
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tip = !tip;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
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
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.Add_Tip.tr()),
                                  tip == false
                                      ? Icon(
                                          Icons.add,
                                          color: mainColor,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                              tip == true
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: TipInputField(
                                        // color: wh,
                                        hint: LocaleKeys.Enter_Tip.tr(),
                                        type: TextInputType.number,
                                        controller: tipcontroller,
                                        onpressed: () {
                                          setState(() {
                                            val1 = !val1;
                                            tipcontroller.text == ''
                                                ? Addtip = int.parse('0')
                                                : total = total! +
                                                    int.parse(
                                                        tipcontroller.text);
                                          });
                                        },
                                        onRmvPressed: () {
                                          setState(() {
                                            val1 = !val1;
                                            // tipcontroller.text = '';
                                            total = total! -
                                                int.parse(tipcontroller.text);
                                            tipcontroller.text = '';
                                          });
                                        },
                                        readOnly: val1,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.only(top: 20,bottom: 20,right: 12,left: 12),
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
                                Text(LocaleKeys.Subtotal.tr()),
                                Text(
                                    'AED' + ' ' + widget.data!.price.toString())
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.Tip.tr()),
                                  Text('AED' + ' ' + tipcontroller.text),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.discount_amount.tr()),
                                  Text("10%"),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.Total_bill.tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text('${total}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                    Text('AED',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 12),
                            child: Text(
                              LocaleKeys.Payment_Method.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 21),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 8),
                            child: Text(
                              LocaleKeys.Select_your_Payment_Method.tr(),
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
                            value: PayMethod.materCard,
                            onchaged: () {
                              toggleplan(PayMethod.materCard);
                            },
                          ),
                          PPaymentMethod(
                            title: 'Google Pay',
                            image: "assets/images/google.png",
                            value: PayMethod.googlePay,
                            groupvalue: _site,
                            onchaged: () {
                              toggleplan(PayMethod.googlePay);
                            },
                            onpress: () {},
                          ),
                          PPaymentMethod(
                            title: 'Apple Pay',
                            image: "assets/images/apple.png",
                            groupvalue: _site,
                            value: PayMethod.applePay,
                            onchaged: () {
                              toggleplan(PayMethod.applePay);
                            },
                          ),
                          PPaymentMethod(
                            title: 'wallet Pay',
                            image: "assets/images/apple.png",
                            groupvalue: _site,
                            value: PayMethod.walletpay,
                            onchaged: () {
                              toggleplan(PayMethod.walletpay);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LargeButton(
                        onPressed: () async {
                          // Navigator.pushNamed(context, 'booking_confirm');
                          _site == PayMethod.materCard
                              ? await paayment()
                              : walletpayment();
                        },
                        title: LocaleKeys.continu.tr(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
