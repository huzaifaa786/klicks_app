// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/checkoutBtn.dart';
import 'package:klicks_app/static/extra_list_item.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/select_car_card.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class CarSelect extends StatefulWidget {
  CarSelect({
    Key? key,
    required this.company,
    required this.mall,
    required this.city,
    // required this.uid,
  }) : super(key: key);
  final Mall mall;
  final Company company;
  final City city;
  // final int uid;
  @override
  State<CarSelect> createState() => _CarSelectState();
}

class _CarSelectState extends State<CarSelect> {
  SelectedCarInfo data = SelectedCarInfo();
  List<ExtraService> services = [];
  List selectedExtraService = [];
  List selectedExtraServicenames = [];
  List<bool> checked = [];
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
      checked = List<bool>.filled(mservices.length, false);
      services = mservices;
      log(services.length.toString());
    });
  }

  proceed() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authCheck = prefs.getString('api_token');
    if (authCheck == null) {
      prefs.setString('data', jsonEncode(data));
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => new LoginScreen(nextScreen: 'checkout')));
    } else {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => new CheckOutScreen(data: data)));
    }
  }

  void initState() {
    super.initState();
    comprice = int.parse(widget.company.sedan_price!);
    price = comprice;
    data.mall = widget.mall;
    data.company = widget.company;
    data.selectedcartype = Selectedvalue;
    // data.uid = widget.uid;
    data.cityId = widget.city.id;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: White,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
          child: Column(
            children: [
              TitleTopbar(
                text: LocaleKeys.Details.tr(),
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.87,
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
                            Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Text(
                                LocaleKeys.Choose_your_car.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            SelectCarCard(
                              image: 'assets/images/car1.png',
                              ontap: () {
                                setState(() {
                                  Selectedvalue = 'sedan';
                                  data.selectedcartype = Selectedvalue;
                                  price -= int.parse(widget.company.suv_price!);
                                  price +=
                                      int.parse(widget.company.sedan_price!);
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
                                  price -=
                                      int.parse(widget.company.sedan_price!);
                                  price += int.parse(widget.company.suv_price!);
                                });
                              },
                              selected: Selectedvalue == 'suv' ? true : false,
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Text(
                                LocaleKeys.Floor_Number.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            IconInputField(
                              imageIcon: 'assets/images/floor.svg',
                              hint: LocaleKeys.Enter_Floor_Number.tr(),
                              controller: floorNumberController,
                              onChange: floorNumber,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6, top: 12),
                              child: Text(
                                LocaleKeys.Parking_Number.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            IconInputField(
                              imageIcon: 'assets/images/parking.svg',
                              hint: LocaleKeys.Enter_Parking_Number.tr(),
                              controller: parkingNumberController,
                              onChange: parkingNumber,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6, top: 12),
                              child: Text(
                                LocaleKeys.Plate_Number.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            IconInputField(
                              controller: plateNumberController,
                              imageIcon: 'assets/images/plate.svg',
                              hint: LocaleKeys.Enter_Plate_Number.tr(),
                              onChange: plateNumber,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12, top: 12),
                              child: Text(
                                LocaleKeys.Selected_Mall.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                widget.mall.image != null
                                    ? CircleAvatar(
                                        radius: 19,
                                        backgroundImage:
                                            CachedNetworkImageProvider(widget.mall.image!),
                                        foregroundImage:
                                            CachedNetworkImageProvider(widget.mall.image!),
                                      )
                                    : CircleAvatar(
                                        radius: 19,
                                        backgroundColor: mainColor,
                                        child: Text('Mall',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.white)),
                                      ),
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
                                LocaleKeys.Selected_Company.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                widget.company.image != null
                                    ? CircleAvatar(
                                        radius: 19,
                                        backgroundImage:
                                            CachedNetworkImageProvider(widget.company.image!),
                                        foregroundImage:
                                            CachedNetworkImageProvider(widget.company.image!),
                                      )
                                    : CircleAvatar(
                                        radius: 19,
                                        backgroundColor: mainColor,
                                        child: Text('Company',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.white)),
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
                            services.length == 0
                                ? Container()
                                : Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 2, top: 20),
                                    child: Text(
                                      "Add Extra",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                            Container(
                              height: services.length == 0
                                  ? 8
                                  : MediaQuery.of(context).size.height * 0.13,
                              child: services.length == 0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: services.length,
                                      itemBuilder: (context, index) {
                                        return ExtraListTile(
                                          image: services[index].image,
                                          text: services[index].service_name,
                                          ontap: () {
                                            setState(() {
                                              checked[index] = !checked[index];
                                              Selectedvalue == 'suv'
                                                  ? price = int.parse(
                                                      widget.company.suv_price!)
                                                  : price = int.parse(widget
                                                      .company.sedan_price!);
                                              selectedExtraService = [];
                                              selectedExtraServicenames = [];
                                              for (int i = 0;
                                                  i < services.length;
                                                  i++) {
                                                if (checked[i]) {
                                                  selectedExtraService
                                                      .add(services[i].id);
                                                      selectedExtraServicenames
                                                      .add(services[i].service_name);
                                                  price += int.parse(services[i]
                                                      .price
                                                      .toString());
                                                }
                                              }
                                              data.extraService =
                                                  selectedExtraService; 
                                              data.extraServicenames =
                                                  selectedExtraServicenames;
                                              print(data.extraService);
                                            });
                                          },
                                          selected: checked[index],
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 12),
                      Divider(),
                      CheckOutButton(
                        ontap: () {
                          setState(() {
                            data.price = price;
                          });
                          if (data.floorNumber == null) {
                            Fluttertoast.showToast(
                                msg: "Floor Number can't be empty");
                          } else {
                            if (data.parkingNumber == null) {
                              Fluttertoast.showToast(
                                  msg: "Parking Number can't be empty");
                            } else {
                              if (data.plateNumber == null) {
                                Fluttertoast.showToast(
                                    msg: "Plate Number can't be empty");
                              } else {
                                proceed();
                              }
                            }
                          }
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
      ),
    );
  }
}
