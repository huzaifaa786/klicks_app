// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/api/order.dart';
import 'package:klicks_app/model/Order.dart';
import 'package:klicks_app/model/extra_services_detail.dart';
import 'package:klicks_app/static/badge.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/checkOut_tile.dart';
import 'package:klicks_app/values/colors.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
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
                SizedBox(height: 20),
                CheckOutTile(
                  title: 'Vehicle Type',
                  discription: widget.order!.cartype,
                ),
                CheckOutTile(
                  title: 'Build Company:',
                  discription: widget.order!.company,
                ),
                CheckOutTile(
                  title: 'Number Plate:',
                  discription: widget.order!.plate_number,
                ),
                CheckOutTile(
                  title: 'Parking Number:',
                  discription: widget.order!.parking,
                ),
                CheckOutTile(
                  title: 'Mall',
                  discription: widget.order!.mall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Extras: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: colorgrey),
                      ),
                    ),
                    Column(
                      children: [
                        for (var service in services)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              service == ''
                                  ? 'No Extra Services'
                                  : service.service_name! + ', ',
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          )
                      ],
                    )
                  ],
                ),
                // for (var service in services)
                //   service == null
                //       ? CheckOutTile(
                //           title: 'Extras: ',
                //           discription: '',
                //         )
                //       : CheckOutTile(
                //           title: 'Extras: ',
                //           discription: service.service_name,
                //         ),
                SizedBox(
                  height: 4,
                ),
                widget.order!.status == 3
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: colorgrey),
                          ),
                          Badge(
                            title: 'Complete',
                            color: Colors.green,
                            ontap: () {},
                          )
                        ],
                      )
                    : widget.order!.status == 2
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: colorgrey),
                              ),
                              Badge(
                                title: 'Rejected',
                                color: Colors.red,
                                ontap: () {},
                              )
                            ],
                          )
                        : widget.order!.status == 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: colorgrey),
                                  ),
                                  Badge(
                                    title: 'Accepted',
                                    color: Colors.green,
                                    ontap: () {},
                                  )
                                ],
                              )
                            : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: colorgrey),
                              ),
                              Badge(
                                title: 'In process',
                                color: InprocessColor,
                                ontap: () {},
                              )
                            ],
                          ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
