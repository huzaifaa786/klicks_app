// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:klicks_app/static/checkoutBtn.dart';
import 'package:klicks_app/static/extra_list_item.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/select_car_card.dart';
import 'package:klicks_app/static/topbar.dart';

class CarSelect extends StatefulWidget {
  const CarSelect({super.key});

  @override
  State<CarSelect> createState() => _CarSelectState();
}

class _CarSelectState extends State<CarSelect> {
  String? Selectedvalue = "sedan";
  bool SelectedoilService = false;
  bool SelectedtyreService = false;
  bool SelectedengineService = false;
  bool SelectedinteriorService = false;
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
                                'Dubai Mall',
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
                              Image(image: AssetImage('assets/images/Bmw.png')),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'BMW',
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
                          ExtraListTile(
                            image: 'assets/images/oil.png',
                            text: 'Oil Change',
                            ontap: () {
                              setState(() {
                                SelectedoilService = !SelectedoilService;
                              });
                            },
                            selected: SelectedoilService == true ? true : false,
                          ),
                          SizedBox(height: 12),
                          ExtraListTile(
                            image: 'assets/images/tyre.png',
                            text: 'Tyre service',
                            ontap: () {
                              setState(() {
                                SelectedtyreService = !SelectedtyreService;
                              });
                            },
                            selected:
                                SelectedtyreService == true ? true : false,
                          ),
                          SizedBox(height: 12),
                          ExtraListTile(
                            image: 'assets/images/engine.png',
                            text: 'Engine service',
                            ontap: () {
                              setState(() {
                                SelectedengineService = !SelectedengineService;
                              });
                            },
                            selected:
                                SelectedengineService == true ? true : false,
                          ),
                          SizedBox(height: 12),
                          ExtraListTile(
                            image: 'assets/images/interior_wash.png',
                            text: 'Interior wash',
                            ontap: () {
                              setState(() {
                                SelectedinteriorService =
                                    !SelectedinteriorService;
                              });
                            },
                            selected:
                                SelectedinteriorService == true ? true : false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    CheckOutButton(
                      ontap: () {
                        Navigator.pushNamed(context, 'checkOut');
                      },
                      price: '45.00',
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
