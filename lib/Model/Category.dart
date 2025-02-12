class Category {
  int? id;
  String? categoryName;
  String? image;

  Category({this.id, this.categoryName, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    image = json['image'];
  }
}
