class City {
  int? id;
  String? name;

  City(city) {
    id = city['id'];
    name = city['name'];
   
  }
}