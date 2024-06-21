import 'package:flutter/material.dart';
import 'package:loyalty_business_project/models/product.dart';
import 'package:loyalty_business_project/pages/purchase_builder/components/scrollable_filter.dart';
import 'package:loyalty_business_project/utils/test_data.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  ProductSearchPageState createState() => ProductSearchPageState();
}

class ProductSearchPageState extends State<ProductSearchPage> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<Product> allProducts = TestData().products;
  List<Product> filteredProducts = [];
  List<Product> selectedProducts = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filteredProducts = allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    final backgroundColor = Theme.of(context).colorScheme.background;
    return PopScope(
      canPop: false,
      onPopInvoked: (isPop) async {
        Navigator.pop(context, selectedProducts);
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: backgroundColor,
          backgroundColor: backgroundColor,
          title: Text('Buscar Productos', style: Theme.of(context).textTheme.titleMedium,),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).colorScheme.secondary.withOpacity(0.75),
            tabs: const [
              Tab(text: 'Productos disponibles'),
              Tab(text: 'Carrito de compra'),
            ],
          ),
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
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildProductList(filteredProducts),
                  _buildProductList(selectedProducts),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
          onTap: () {
            setState(() {
              if (_tabController.index == 0) {
                selectedProducts.add(products[index]);
                allProducts.remove(products[index]);
                filteredProducts.remove(products[index]);
              } else {
                selectedProducts.remove(products[index]);
                allProducts.add(products[index]);
              }
            });
          },
        );
      },
    );
  }
}
