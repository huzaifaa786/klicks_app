class OrderDetail {
  String? company_name;
  String? mall_name;

  OrderDetail(orderDetail) {
    mall_name = orderDetail['mall']['name'];
    company_name = orderDetail['company']['name'];
  }
}
