import 'package:flutter/material.dart';
import 'package:loyalty_business_project/services/product_service.dart';

import '../../../models/product.dart';
import '../../../utils/style_constants.dart';
import '../../../widgets/buttons.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key, this.product});

  final Product? product;

  @override
  AddProductFormState createState() => AddProductFormState();
}

class AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final ProductService productService = ProductService();
  late String? _productName = widget.product?.name;
  late double? _productPrice = widget.product?.price;
  late String? _productDescription = widget.product?.description;
  late String? _productTag = widget.product?.tag;

  final List<String> _tags = [
    'Hamburguesa',
    'Pizza',
    'Hot Dog',
    'Sandwich',
    'Ensalada'
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: StyleConstants.buildTextInputDecoration(
                'Product Name', context),
            style: textTheme.bodyLarge,
            initialValue: _productName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the product name';
              }
              return null;
            },
            onSaved: (value) {
              _productName = value;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: StyleConstants.buildTextInputDecoration(
                'Price', context),
            style: textTheme.bodyLarge,
            keyboardType: TextInputType.number,
            initialValue: _productPrice.toString(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _productPrice = double.parse(value!);
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: StyleConstants.buildTextInputDecoration(
                'Description', context),
            style: textTheme.bodyLarge,
            maxLines: 3,
            initialValue: _productDescription,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the description';
              }
              return null;
            },
            onSaved: (value) {
              _productDescription = value;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: StyleConstants.buildTextInputDecoration('Tag', context),
            style: textTheme.bodyLarge,
            value: _tags.first,
            items: _tags.map((tag) {
              return DropdownMenuItem(
                value: tag,
                child: Text(tag),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _productTag = value;
              });
            },
            onSaved: (value) {
              _productTag = value;
            },
          ),
          const SizedBox(height: 24),
          TemplateButton.createPrimaryButton('Add product', () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              dynamic response;
              Product product = Product(id: widget.product?.id,
                  name: _productName!,
                  price: _productPrice!,
                  description: _productDescription!,
                  tag: _productTag!);
              if (widget.product == null) {
                response = productService.createProduct(product);
              } else {
                response = productService.updateProduct(product);
              }

              if (response.statusCode == 200) Navigator.of(context).pop();
            }
          }, context),
        ],
      ),
    );
  }
}
