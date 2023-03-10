// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/checkoutBtn.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/select_car_card.dart';
import 'package:klicks_app/static/topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:easy_localization/easy_localization.dart';

class CarSelect extends StatefulWidget {
  CarSelect({
    Key? key,
    required this.company,
    required this.mall,
    required this.city,
    required this.uid,
  }) : super(key: key);
  final Mall mall;
  final Company company;
  final City city;
  final int uid;
  @override
  State<CarSelect> createState() => _CarSelectState();
}

class _CarSelectState extends State<CarSelect> {
  SelectedCarInfo data = SelectedCarInfo();
  List<ExtraService> services = [];
  List selectedExtraService = [];
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
    });
  }

  void initState() {
    super.initState();
    comprice = int.parse(widget.company.sedan_price!);
    price = comprice;
    data.mall = widget.mall;
    data.company = widget.company;
    data.selectedcartype = Selectedvalue;
    data.uid = widget.uid;
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
                              LocaleKeys.Floor_Number.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
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
                                  fontWeight: FontWeight.w500, fontSize: 14),
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
                                  fontWeight: FontWeight.w500, fontSize: 14),
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
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              widget.mall.image != null
                                  ? CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          NetworkImage(widget.mall.image!),
                                      foregroundImage:
                                          NetworkImage(widget.mall.image!),
                                    )
                                  : CircleAvatar(
                                      radius: 15,
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
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              widget.company.image != null
                                  ? CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          NetworkImage(widget.company.image!),
                                      foregroundImage:
                                          NetworkImage(widget.company.image!),
                                    )
                                  : CircleAvatar(
                                      radius: 15,
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
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 12, top: 20),
                          //   child: Text(
                          //     "Add Extra",
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w500, fontSize: 14),
                          //   ),
                          // ),
                          MultiSelectFormField(
                            title: Text(LocaleKeys.Add_Extra_Services.tr()),
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
                            okButtonLabel: LocaleKeys.OK.tr(),
                            cancelButtonLabel: LocaleKeys.CANCEL.tr(),
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
                                  var temp = services.singleWhere((item) =>
                                      item.id.toString() ==
                                      Hello[i].toString());
                                  selectedExtraService.add(temp.id);
                                  print(selectedExtraService);
                                  price += int.parse(temp.price.toString());
                                }
                                data.extraService = selectedExtraService;
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
                        });
                        if (data.floorNumber == null &&
                            data.plateNumber == null &&
                            data.parkingNumber == null) {
                              print('object');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                data: data,
                              ),
                            ),
                          );
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
    );
  }
}
