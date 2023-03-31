class City {
  int? id;
  String? name;
  String? image;

   City(city) {
    id = city['id'];
    name = city['name'];
    image = city['image'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
