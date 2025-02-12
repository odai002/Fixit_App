class Homeowner {
  int? id;
  String? role;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? country;
  String? city;
  int? isBanned;

  Homeowner(
      {this.id,
      this.role,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.country,
      this.city,
      this.isBanned});

  Homeowner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    isBanned = json['is_banned'];
  }
}
