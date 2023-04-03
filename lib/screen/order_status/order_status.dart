// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/api/order.dart';
import 'package:klicks_app/model/Order.dart';
import 'package:klicks_app/model/extra_services_detail.dart';
import 'package:klicks_app/static/badge.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;
class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key, this.order});
  final OrderModal? order;

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  List<ExtraServiceDetail> services = [];
  getservice() async {
    var morderServices =
        await OrderApi.ExtraServicesINOrder(widget.order!.id.toString());
    setState(() {
      services = [];
      services = morderServices;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getservice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.locale.toString() == 'en'?  ui.TextDirection.ltr : ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: White,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(45),
                                ),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_left_outlined,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  LocaleKeys.Order_Detail.tr(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SvgPicture.asset('assets/images/order.svg',
                                      height: 20, width: 20)),
                            ],
                          ),
                          Text(
                            '.sdkjf',
                            style: TextStyle(color: White),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    LocaleKeys.order_id.tr() + ': ' + widget.order!.id.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(right: 2, left: 1),
                    padding:
                        EdgeInsets.only(right: 12, left: 12, top: 16, bottom: 16),
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
                          discription: widget.order!.cartype,
                          image: 'assets/images/vehicleType.svg',
                        ),
                        CheckOutTile(
                          title: LocaleKeys.Build_Company.tr() + ':',
                          discription: widget.order!.company,
                          image: 'assets/images/providerCompany.svg',
                        ),
                        CheckOutTile(
                          title: LocaleKeys.Number_Plate.tr() + ':',
                          discription: widget.order!.plate_number,
                          image: 'assets/images/numberPlate.svg',
                        ),
                        CheckOutTile(
                            title: LocaleKeys.Parking_Number.tr() + ':',
                            discription: widget.order!.parking,
                            image: 'assets/images/parkingNumber.svg'),
                        CheckOutTile(
                            title: LocaleKeys.Mall.tr() + ':',
                            discription: widget.order!.mall,
                            image: 'assets/images/mallCheckout.svg'),
                        CheckOutTile(
                            title: LocaleKeys.Floor_Number.tr() + ':',
                            discription: widget.order!.floor,
                            image: 'assets/images/floorNumberCheck.svg'),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: context.locale.toString() == 'en'? EdgeInsets.only(right: 8): EdgeInsets.only(left: 8),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 224, 240, 255),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: SvgPicture.asset(
                                            'assets/images/Extras.svg',
                                            height: 12,
                                            width: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      LocaleKeys.Extras.tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: colorgrey),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  for (var service in services)
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        service == ''
                                            ? 'No Extra Services'
                                            : service.service_name! + ', ',
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                          widget.order!.price! + " AED",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  widget.order!.status == 3
                      ? Badge(
                          title: LocaleKeys.Completed.tr(),
                          color: Colors.green,
                          ontap: () {},
                        )
                      : widget.order!.status == 2
                          ? Badge(
                              title: LocaleKeys.Rejected.tr(),
                              color: Colors.red,
                              ontap: () {},
                            )
                          : Badge(
                              title: LocaleKeys.In_progress.tr(),
                              color: InprocessColor,
                              ontap: () {},
                            ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
