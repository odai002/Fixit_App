class Contractor{
  final int id;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String country;
  final String city;
  final int isBanned;
  final String? description;
  final String category;
  final double averageRating;

  Contractor({
  required this.id,
  required this.username,
  required this.email,
  required this.phone,
  required this.address,
  required this.country,
  required this.city,
  required this.isBanned,
  this.description,
  required this.category,
  required this.averageRating,
  });

  // دالة لتحويل JSON إلى كائن Contractor
  factory Contractor.fromJson(Map<String, dynamic> json) {
  return Contractor(
  id: json['id'],
  username: json['username'],
  email: json['email'],
  phone: json['phone'],
  address: json['address'],
  country: json['country'],
  city: json['city'],
  isBanned: json['is_banned'],
  description: json['description'],
  category: json['category'],
  averageRating: (json['average_rating'] ?? 0).toDouble(),
  );
  }
  }
