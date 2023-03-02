import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';

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
}
