class User {
  String? token;
  String? role;

  User({this.token, this.role});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'];
  }
}
