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
  var uid;
  var cityId;
  List? extraService = [];

  SelectedCarInfo({
    this.plateNumber,
    this.floorNumber,
    this.parkingNumber,
    this.selectedcartype,
    this.mall,
    this.company,
    this.uid,
    this.cityId,
    this.extraService,
    this.price,
  });
    Map<String, dynamic> toJson() => {
        'plateNumber': plateNumber,
        'floorNumber': floorNumber,
        'parkingNumber': parkingNumber,
        'selectedcartype': selectedcartype,
        'mall': mall,
        'company': company,
        'cityId': cityId,
        'extraService': extraService,
        'price': price,
      };
}
