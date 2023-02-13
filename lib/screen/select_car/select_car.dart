// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/checkoutBtn.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/select_car_card.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

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
  SelectedCarInfo data = SelectedCarInfo();
  List<ExtraService> services = [];
  List<ExtraService> selectedExtraService = [];
  TextEditingController plateNumberController = TextEditingController();
  plateNumber(Value) {
    setState(() {
      data.plateNumber = Value;
    });
  }

  TextEditingController floorNumberController = TextEditingController();
  floorNumber(Value) {
    setState(() {
      data.floorNumber = Value;
    });
  }

  TextEditingController parkingNumberController = TextEditingController();
  parkingNumber(Value) {
    setState(() {
      data.parkingNumber = Value;
    });
  }

  getservice() async {
    services = [];
    var mservices = await CityApi.getservice(widget.company.company_id);
    setState(() {
      services = mservices;
      log(services.length.toString());
      log(services[0].service_name.toString());
    });
  }

  void initState() {
    super.initState();
    comprice = int.parse(widget.company.sedan_price!);
    price = comprice;
    data.mall = widget.mall;
    data.company = widget.company;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getservice();
    });
  }

  String? Selectedvalue = "sedan";
  var comprice = 0;
  var price = 0;

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
                                data.selectedcartype = Selectedvalue;
                                price -= int.parse(widget.company.suv_price!);
                                price += int.parse(widget.company.sedan_price!);
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
                                data.selectedcartype = Selectedvalue;
                                price -= int.parse(widget.company.sedan_price!);
                                price += int.parse(widget.company.suv_price!);
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
                            controller: floorNumberController,
                            onChange: floorNumber,
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
                            controller: parkingNumberController,
                            onChange: parkingNumber,
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
                            controller: plateNumberController,
                            imageIcon: 'assets/images/plate.svg',
                            hint: 'Enter Plate Number',
                            onChange: plateNumber,
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
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 12, top: 20),
                          //   child: Text(
                          //     "Add Extra",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w500, fontSize: 14),
                          //   ),
                          // ),
                          MultiSelectFormField(
                            title: Text("Add Extra Services"),
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return '';
                              }
                              return null;
                            },
                            dataSource: [
                              for (var i = 0; i < services.length; i++)
                                {
                                  "display":
                                      services[i].service_name.toString(),
                                  "value": services[i].id.toString(),
                                }
                            ],
                            chipBackGroundColor: Colors.blue,
                            chipLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            dialogTextStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            checkBoxActiveColor: Colors.blue,
                            checkBoxCheckColor: Colors.white,
                            dialogShapeBorder: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            hintWidget: Text('choose services'),
                            initialValue: null,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                List Hello = value as List;
                                Selectedvalue == 'suv'
                                    ? price =
                                        int.parse(widget.company.suv_price!)
                                    : price =
                                        int.parse(widget.company.sedan_price!);
                                selectedExtraService = [];
                                for (var i = 0; i < Hello.length; i++) {
                                  log(Hello[i]);
                                  // ignore: unnecessary_cast
                                  ExtraService temp = services.singleWhere(
                                      (item) =>
                                          item.id.toString() ==
                                          Hello[i].toString()) as ExtraService;
                                  selectedExtraService.add(temp);
                                  print(selectedExtraService);
                                  price += int.parse(temp.price.toString());
                                }
                                data.ExtraService = selectedExtraService;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    CheckOutButton(
                      ontap: () {
                        setState(() {
                          data.price = price;
                          print(data.price);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckOutScreen(data: data,),
                          ),
                        );
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
