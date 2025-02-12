class ContractorPortfolio {
  int? id;
  int? userId;
  String? category;
  String? description;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? country;
  String? city;
  int? averageRating;
  int? totalRating;
  List<PortfolioImage>? portfolioImage;
  List<Rating>? rating;

  ContractorPortfolio(
      {this.id,
      this.userId,
      this.category,
      this.description,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.country,
      this.city,
      this.averageRating,
      this.totalRating,
      this.portfolioImage,
      this.rating});

  ContractorPortfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    category = json['category'];
    description = json['description'] ?? "No description";
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    averageRating = json['average_rating'];
    totalRating = json['total_rating'];
    if (json['portfolio_image'] != null) {
      portfolioImage = <PortfolioImage>[];
      json['portfolio_image'].forEach((v) {
        portfolioImage!.add(PortfolioImage.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(Rating.fromJson(v));
      });
    }
  }
}

class PortfolioImage {
  int? id;
  int? imageId;
  int? contractorId;
  String? name;

  PortfolioImage({this.id, this.imageId, this.contractorId, this.name});

  PortfolioImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
    contractorId = json['contractor_id'];
    name = json['name'];
  }
}

class Rating {
  int? id;
  int? userId;
  int? contractorId;
  String? comment;
  int? rate;
  String? username;

  Rating(
      {this.id,
      this.userId,
      this.contractorId,
      this.comment,
      this.rate,
      this.username});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    contractorId = json['contractor_id'];
    comment = json['comment'];
    rate = json['rate'];
    username = json['username'];
  }
}
