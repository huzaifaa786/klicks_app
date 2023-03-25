class NotificationModal {
  int? id;
  String? title;
  int? company_id;
  String? body;
  int? order_id;
  int? user_id;
  DateTime? dateTime;
  int? orderId;
  String? mall;
  String? company;
  String? parking;
  String? plate_number;
  String? floor;
  String? user;
  int? status;
  String? cartype;
  String? price;
  List? service = [''];

  NotificationModal(noti) {
    id = noti['id'];
    title = noti['title'];
    order_id = noti['order_id'];
    body = noti['body'];
    company_id = noti['company_id'];
    user_id = noti['user_id'];
    dateTime = DateTime.parse(noti['created_at']);
    orderId = noti['order']['id'];
    // mall = noti['order']['mall']['name'];
    parking = noti['order']['parking'];
    plate_number = noti['order']['number_plate'];
    floor = noti['order']['floor'];
    status = noti['order']['status'];
    price = noti['order']['totalpayment'] ?? '';
    cartype = noti['order']['cartype'];
    // service = noti['order']['service'] as List?;
  }
}
