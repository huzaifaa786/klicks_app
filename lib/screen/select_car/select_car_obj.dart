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
  List? ExtraService = [];

  SelectedCarInfo({
    this.plateNumber,
    this.floorNumber,
    this.parkingNumber,
    this.selectedcartype,
    this.mall,
    this.company,
    this.uid,
    this.cityId,
    this.ExtraService,
    this.price,
  });
}
