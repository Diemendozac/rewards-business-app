import 'package:flutter/material.dart';
import 'package:loyalty_business_project/models/product.dart';
import 'package:loyalty_business_project/pages/product_builder_page/product_builder_page.dart';
import 'package:loyalty_business_project/pages/purchase_builder/components/scrollable_filter.dart';
import 'package:loyalty_business_project/utils/test_data.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  static const route = '/products';

  @override
  ProductListPageState createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> allProducts = TestData().products;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _addProduct() {
    // Navega a la página para agregar productos
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductBuilderPage()),
    );
  }

  void _editProduct(Product product) {
    // Navega a la página para editar el producto
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductBuilderPage(product: product)),
    );
  }

  void _deleteProduct(Product product) {
    setState(() {
      allProducts.remove(product);
      filteredProducts.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        title: Text(
          'Lista de Productos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addProduct,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchBar(
                  controller: _searchController,
                  backgroundColor: const MaterialStatePropertyAll(Color(0x50bdbdbd)),
                  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                  overlayColor: const MaterialStatePropertyAll(Color(0x51bdbdbd)),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  surfaceTintColor: const MaterialStatePropertyAll(Color(0x50bdbdbd)),
                  leading: const Icon(Icons.search),
                  padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 15)),
                  textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.titleMedium),
                  onChanged: (String? value) {
                    _filterProducts(value ?? '');
                  },
                ),
                const SizedBox(height: 10),
                ScrollableTagFilter(
                  tags: TestData().filterTags,
                  onTagSelected: (selectedTags) {
                    if (selectedTags.isEmpty) {
                      setState(() {
                        filteredProducts = allProducts;
                      });
                    } else {
                      setState(() {
                        filteredProducts = allProducts.where((element) => selectedTags.contains(element.tag)).toList();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editProduct(product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteProduct(product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

