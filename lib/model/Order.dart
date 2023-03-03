
class OrderModal {
  int? id;
  String? mall;
  String? company;
  String? parking;
  String? plate_number;
  String? floor;
  String? user;
  int? status;
  String? cartype;
  String? price;
  DateTime? dateTime;
  List? service = [''];

  OrderModal(order) {
    id = order['id'];
    mall = order['mall']['name'];
    company = order['company']['name'];
    parking = order['parking'];
    plate_number = order['number_plate'];
    floor = order['floor'];
    status = order['status'];
    dateTime = DateTime.parse(order['created_at']);
    price = order['totalpayment'] ?? '';
    user = order['user']['name'] ?? '';
    cartype = order['cartype'];
    service = order['service'] as List?;
  }
}
