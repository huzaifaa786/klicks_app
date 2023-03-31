class Mall {
  int? id;
  String? name;
  String? image;

  Mall(mall) {
    id = mall['id'];
    name = mall['name'];
    image = mall['image'];
  }
    Map<String, dynamic> toJson() => {
        'name': name,
         'id': id,
          'image': image,
       
      };
}