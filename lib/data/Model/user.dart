class User {
  final String role;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String country;
  final String city;
  final String password;
  final String password_confirmation;
  final int? category_id;

  User({
     required this.role,
     required this.username,
     required this.email,
     required this.phone,
     required this.address,
     required this.country,
     required this.city,
     required this.password,
     required this.password_confirmation,
      this.category_id
});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      role: json["role"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      country: json["country"],
      city: json["city"],
      password: json["password"],
      password_confirmation: json["password_confirmation"],
      category_id: int.parse(json["category_id"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      if (category_id != null) "category_id": category_id,
      "role": role,
      "country": country,
      "city": city,
      "address": address,
      "password": password,
      "password_confirmation": password_confirmation,
    };
  }
//
}
