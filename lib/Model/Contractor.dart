class Contractor {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? country;
  String? city;
  int? isBanned;
  String? description;
  String? category;
  bool? hasTask;
  int? averageRating;
  List<ImagesProtfolio>? imagesProtfolio;

  Contractor(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.country,
      this.city,
      this.isBanned,
      this.description,
      this.category,
      this.hasTask,
      this.averageRating,
      this.imagesProtfolio});

  Contractor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    isBanned = json['is_banned'];
    description = json['description'];
    category = json['category'];
    hasTask = json['has_task'];
    averageRating = json['average_rating'];
    if (json['images_protfolio'] != null) {
      imagesProtfolio = <ImagesProtfolio>[];
      json['images_protfolio'].forEach((v) {
        imagesProtfolio!.add(ImagesProtfolio.fromJson(v));
      });
    }
  }
}

class ImagesProtfolio {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ImagesProtfolio({this.id, this.name, this.createdAt, this.updatedAt});

  ImagesProtfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
