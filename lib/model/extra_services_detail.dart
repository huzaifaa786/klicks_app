class ExtraServiceDetail {
  int? id;
  int? company_id;
  String? service_name;
  String? price;
  String? image;

  ExtraServiceDetail(extraservice) {
    company_id = extraservice['service']['company_id'];
    service_name = extraservice['service']['service_name'];
    price = extraservice['service']['price'];
    image = extraservice['service']['image'];
    id = extraservice['service']['id'];
  }
}
