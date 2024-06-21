import 'package:flutter/material.dart';
import 'package:loyalty_business_project/models/product.dart';
import '../../http/request/product_purchase_request.dart';
import '../../widgets/buttons.dart';
import '../../widgets/colored_safe_area.dart';
import '../purchase_sumary_page/purchase_sumary_page.dart';
import 'components/product_search_page.dart';

class PurchaseBuilderPage extends StatefulWidget {


  static const route = '/order';
  const PurchaseBuilderPage({super.key});

  @override
  State<PurchaseBuilderPage> createState() => _PurchaseBuilderPageState();
}

class _PurchaseBuilderPageState extends State<PurchaseBuilderPage> {
  final List<ProductPurchaseItem> _products = []; // Each product with its quantity

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    final titleTheme = Theme.of(context).textTheme.titleLarge;

    return ColoredSafeArea(
      color: backgroundColor,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: backgroundColor,
          backgroundColor: backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Generar Compra', style: titleTheme),
              const SizedBox(height: 30),
              Expanded(child: _buildProductList(context)),
              const SizedBox(height: 10),
              _buildGeneratePurchaseButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Products', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        _buildAddProductCard(context),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return _buildProductCard(_products[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddProductCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateAndSelectProduct(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 10),
              Text('Add Product', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductPurchaseItem productItem, int index) {
    final product = productItem.product;
    final quantity = productItem.quantity;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(product.name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => _changeProductQuantity(index, quantity - 1),
            ),
            Text(quantity.toString(), style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _changeProductQuantity(index, quantity + 1),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeProduct(index),
            ),
          ],
        ),
      ),
    );
  }

  void _changeProductQuantity(int index, int newQuantity) {
    if (newQuantity < 1) return; // Prevent quantity less than 1
    setState(() {
      _products[index].quantity = newQuantity;
    });
  }

  void _navigateAndSelectProduct(BuildContext context) async {
    final List<Product>? selectedProducts = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductSearchPage()),
    );

    if (selectedProducts != null) {
      setState(() {
        for (var product in selectedProducts) {
          int index = _products.indexWhere((element) => element.product == product);
          if (index != -1) {
            _products[index].quantity++;
          } else {
            _products.add(ProductPurchaseItem(product, 1));
          }
        }
      });
    }
  }

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  Widget _buildGeneratePurchaseButton(BuildContext context) {
    return TemplateButton.createPrimaryButton('Generar Compra', () {
      _products.isNotEmpty ? _generatePurchase(context) : null;
    }, context);
  }

  void _generatePurchase(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchaseSummaryPage(products: _products),
      ),
    );
  }
}
