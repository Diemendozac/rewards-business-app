
class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String tag;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tag,
  });

  Map<String, dynamic> toJson (Product product) {
    return {
      'id' : product.id,
      'name' : product.name,
      'tag' : product.tag,
      'description' : product.description,
    };

  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      tag: 'Pizza'
    );
  }
}
