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
  List? ExtraService = [];

  SelectedCarInfo({
    this.plateNumber,
    this.floorNumber,
    this.parkingNumber,
    this.selectedcartype,
    this.mall,
    this.company,
    this.ExtraService,
    this.price,
  });
}
