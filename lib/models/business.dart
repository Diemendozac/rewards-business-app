import 'package:loyalty_business_project/models/product.dart';

class Business {
  String businessId;
  String name;
  String businessType;
  String logoUrl;
  String description;
  List<Product> products;
  String rewardPercentage;

  Business({
    required this.businessId,
    required this.name,
    required this.businessType,
    required this.logoUrl,
    required this.description,
    required this.products,
    required this.rewardPercentage,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    var productsFromJson = json['products'] as List;
    List<Product> productList = productsFromJson.map((i) => Product.fromJson(i)).toList();

    return Business(
      businessId: json['businessId'],
      name: json['name'],
      businessType: json['businessType'],
      logoUrl: json['logoUrl'],
      description: json['description'],
      products: productList,
      rewardPercentage: json['rewardPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessId': businessId,
      'name': name,
      'businessType': businessType,
      'logoUrl': logoUrl,
      'description': description,
      'rewardPercentage': rewardPercentage,
    };
  }
}
