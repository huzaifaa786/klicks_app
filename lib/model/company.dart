class Company {
  int? company_id;
  String? name;
   String? image;

  String? suv_price;
  String? sedan_price;

  Company(company) {
    company_id = company['id'];
    name = company['name'];
      image = company['image'];

    suv_price = company['suv_price'];
    sedan_price = company['sedan_price'];
  }
}
