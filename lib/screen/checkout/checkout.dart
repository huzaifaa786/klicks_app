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

  balance() {
    StripeApi.subtract(widget.data!.price);
  }

  paayment() async {
    LoadingHelper.show();
    if (account!.balance! < widget.data!.price)
      Fluttertoast.showToast(msg: 'wallet amount is less then order amount');
    {
      orderPlaced();
      balance();
    }
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
    super.initState();
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
                    LocaleKeys.Checkout.tr(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CheckOutTile(
                  title: LocaleKeys.Vehicle_Type.tr() + ':',
                  discription: widget.data!.selectedcartype,
                ),
                CheckOutTile(
                  title: LocaleKeys.Build_Company.tr() + ':',
                  discription: widget.data!.company!.name,
                ),
                CheckOutTile(
                  title: LocaleKeys.Number_Plate.tr() + ':',
                  discription: widget.data!.plateNumber,
                ),
                CheckOutTile(
                  title: LocaleKeys.Parking_Number.tr() + ':',
                  discription: widget.data!.parkingNumber,
                ),
                CheckOutTile(
                  title: LocaleKeys.Mall.tr() + ':',
                  discription: widget.data!.mall!.name,
                ),
                CheckOutTile(
                  title: LocaleKeys.Mall.tr() + ':',
                  discription: widget.data!.extraService == null
                      ? 'No, Extra service added'
                      : widget.data!.extraService!.length.toString() +
                          ' ' +
                          'Extra service added',
                ),
                SizedBox(height: 12),
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
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: fieldColor,
                                  hint: LocaleKeys.Enter_Tip.tr(),
                                  type: TextInputType.number,
                                  controller: tipcontroller,
                                  onpressed: () {
                                    setState(() {
                                      val1 = !val1;
                                      tipcontroller.text == ''
                                          ? Addtip = int.parse('0')
                                          : Addtip =
                                              int.parse(tipcontroller.text);
                                    });
                                  },
                                  onRmvPressed: () {
                                    setState(() {
                                      val1 = !val1;
                                      tipcontroller.text = '';
                                      Addtip = int.parse('0');
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
                          Text(LocaleKeys.Subtotal.tr()),
                          Text('AED' + ' ' + widget.data!.price.toString())
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LocaleKeys.Tip.tr()),
                            Text('AED' + ' ' + tipcontroller.text),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            LocaleKeys.Total_bill.tr() ,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                  '${int.parse(widget.data!.price.toString()) + Addtip!}',
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
                ),
                SizedBox(
                  height: 20,
                ),
                LargeButton(
                  onPressed: () async {
                    // Navigator.pushNamed(context, 'booking_confirm');
                    await paayment();
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
    );
  }
}
