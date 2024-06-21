import '../../models/product.dart';

class ProductPurchaseRequest {
  String product;
  int quantity;

  ProductPurchaseRequest(this.product, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
    };
  }

  static List<ProductPurchaseRequest> fromList(
      List<String> products, List<int> quantities) {
    assert(products.length == quantities.length);

    List<ProductPurchaseRequest> requests = [];

    for (int i = 0; i < products.length; i++) {
      requests.add(ProductPurchaseRequest(products[i], quantities[i]));
    }

    return requests;
  }
}

class ProductPurchaseItem {

  Product product;
  int quantity;

  ProductPurchaseItem(this.product, this.quantity);
}
