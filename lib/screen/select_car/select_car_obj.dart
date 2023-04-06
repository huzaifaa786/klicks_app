import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';

class SelectedCarInfo {
  var plateNumber;
  var floorNumber;
  var parkingNumber;
  String? selectedcartype;
  Mall? mall;
  Company? company;
  var price;
  var cityId;
  List? extraService = [];
  List? extraServicenames = [];

  SelectedCarInfo();

    SelectedCarInfo.fromJson(Map<String, dynamic> json)
      : plateNumber = json['plateNumber'],
        floorNumber = json['floorNumber'],
        parkingNumber = json['parkingNumber'],
        selectedcartype = json['selectedcartype'],
        mall = Mall(json['mall']),
        company = Company(json['company']),
        cityId = json['cityId'],
        extraService = json['extraService'],
        extraServicenames = json['extraServicenames'],
        price = json['price'];



    Map<String, dynamic> toJson() => {
        'plateNumber': plateNumber,
        'floorNumber': floorNumber,
        'parkingNumber': parkingNumber,
        'selectedcartype': selectedcartype,
        'mall': mall,
        'company': company,
        'cityId': cityId,
        'extraService': extraService,
        'extraServicenames': extraServicenames,
        'price': price,
      };
}
