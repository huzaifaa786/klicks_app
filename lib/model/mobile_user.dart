class MobUser {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;

  MobUser(user) {
    id = user['id'];
    name = user['name'];
    email = user['email'];
    apiToken = user['api_token'] ?? '';
    phone = user['phone'];
  }
}
