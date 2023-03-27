class User {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;
  String? type;

  User(user) {
    id = user['id'];
    name = user['name'];
    email = user['email'];
    apiToken = user['api_token'] ?? '';
    phone = user['phone'];
    type = user['user_type'];
  }
}
