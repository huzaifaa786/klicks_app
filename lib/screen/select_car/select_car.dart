// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/static/checkoutBtn.dart';
import 'package:klicks_app/static/extra_list_item.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/select_car_card.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CarSelect extends StatefulWidget {
  CarSelect({
    Key? key,
    required this.company,
    required this.mall,
  }) : super(key: key);
  final Mall mall;
  final Company company;
  @override
  State<CarSelect> createState() => _CarSelectState();
}

class _CarSelectState extends State<CarSelect> {
  List<ExtraService> services = [];
  List<MultiSelectItem<ExtraService>> extraservices = [];
    TextEditingController floorController = TextEditingController();
  TextEditingController parkingController = TextEditingController();
  TextEditingController number_plateController = TextEditingController();

  getservice() async {
    var mservice = await CityApi.getservice(widget.company.company_id);
    print(mservice);
    setState(() {
      services = mservice;
      for (var service in services) {
        var extraservice = ExtraService(service);
        extraservices.add(MultiSelectItem(extraservice, '+ add'));
      }
    });
  }

  void initState() {
    super.initState();
    price = int.parse(widget.company.sedan_price!);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getservice();
    });
  }

  String? Selectedvalue = "sedan";
  int? SelectedService = null;
  int? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Topbar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.89,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectCarCard(
                            image: 'assets/images/car1.png',
                            ontap: () {
                              setState(() {
                                Selectedvalue = 'sedan';
                                price = int.parse(widget.company.sedan_price!);
                              });
                            },
                            selected: Selectedvalue == 'sedan' ? true : false,
                          ),
                          SizedBox(height: 8),
                          SelectCarCard(
                            image: 'assets/images/car2.png',
                            ontap: () {
                              setState(() {
                                Selectedvalue = 'suv';
                                price = int.parse(widget.company.suv_price!);
                              });
                            },
                            selected: Selectedvalue == 'suv' ? true : false,
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "Floor Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          IconInputField(
                              controller: floorController,
                            imageIcon: 'assets/images/floor.svg',
                            hint: 'Enter Floor number',
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 12),
                            child: Text(
                              "Parking Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          IconInputField(
                              controller: parkingController,
                            imageIcon: 'assets/images/parking.svg',
                            hint: 'Enter parking number',
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 12),
                            child: Text(
                              "Plate Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          IconInputField(
                              controller: number_plateController,
                            imageIcon: 'assets/images/plate.svg',
                            hint: 'Enter Plate Number',
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 12),
                            child: Text(
                              "Selected Mall",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image(
                                  image: AssetImage(
                                      'assets/images/dubai_mall.png')),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                widget.mall.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 16),
                            child: Text(
                              "Selected Company",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Image(
                                image: NetworkImage(widget.company.image!),
                                height: 34,
                                width: 34,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                '' + widget.company.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 20),
                            child: Text(
                              "Add Extra",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          MultiSelectChipField(
                            items: extraservices,
                            icon: Icon(Icons.check),
                            // itemBuilder: (item, state) {
                            //   // return your custom widget here
                            //   return ExtraListTile(
                            //     image: item.value.image,
                            //     text: item.value.service_name,
                            //     ontap: () {
                            //       setState(() {
                            //         SelectedService = item.value.id;
                            //       });
                            //     },
                            //     selected:
                            //         SelectedService == true ? true : false,
                            //   );
                            // },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    CheckOutButton(
                      ontap: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckOutScreen(
                                      mall: widget. mall,
                                          company: widget.company,
                                          
                                          
                                        )));
                      },
                      price: price.toString(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
