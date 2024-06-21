
import 'package:flutter/material.dart';
import 'package:loyalty_business_project/http/request/product_purchase_request.dart';

class PurchaseSummaryPage extends StatelessWidget {
  final List<ProductPurchaseItem> products;

  const PurchaseSummaryPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen de Compra', style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index].product;
            final quantity = products[index].quantity;
            return ListTile(
              title: Text(product.name),
              subtitle: Text('Cantidad: $quantity\n\$${product.price.toStringAsFixed(2)}'),
            );
          },
        ),
      ),
    );
  }
}
