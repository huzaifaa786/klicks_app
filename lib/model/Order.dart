class Order {
  int? id;
  int? city_id;
  int? mall_id;
  int? company_id;
  String? parking;
  String? floor;
  String? number_plate;
  String? totalpayment;
  String? cartype;

  Order(order) {
    id = order['id'];
    city_id = order['city_id'];
    mall_id = order['mall_id'];
    company_id = order['company_id'];
    floor = order['floor'];
     cartype = order['cartype'];
      totalpayment = order['totalpayment'];
       number_plate = order['number_plate'];
  }
}
