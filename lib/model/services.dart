class ExtraService {
  int? id;
  int? company_id;
  String? service_name;
  String? price;
  String? image;

  ExtraService(extraservice) {
   
    company_id = extraservice['company_id'];
    service_name = extraservice['service_name'];
    price = extraservice['price'];
    image = extraservice['image'];
     id = extraservice['id'];
  }
}
