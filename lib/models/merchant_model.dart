class Merchant {
  final String image;
  final String name;
  final String description;
  final double rating;

  Merchant({
    required this.image,
    required this.name,
    required this.description,
    required this.rating,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['rating'] = rating;
    return data;
  }
}
