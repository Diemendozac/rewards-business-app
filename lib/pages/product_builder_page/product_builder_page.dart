import 'package:flutter/material.dart';
import 'package:loyalty_business_project/models/product.dart';

import '../../widgets/colored_safe_area.dart';
import 'components/product_form.dart';

class ProductBuilderPage extends StatelessWidget {
  const ProductBuilderPage({super.key, this.product});
  final Product? product;
  static const route = '/add_products';


  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme
        .of(context)
        .colorScheme
        .background;

    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          //title: _buildGoBackArrow(context),
        ),
        body: Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildContent(context)
          )

        ),
      ),
    );
  }

  List<Widget> buildContent(BuildContext context) {

    final titleTheme = Theme.of(context).textTheme.titleLarge;
    return [
      Text('Add Product', style: titleTheme,),
      const SizedBox(height: 30,),
      AddProductForm(product: product)

    ];
  }
}
