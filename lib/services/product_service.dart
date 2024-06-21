import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty_business_project/models/product.dart';
import 'dart:convert';

import 'local_storage.dart';

class ProductService {
  final String baseUrl = LocalStorage.prefs.getString('baseUrl')!;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<http.Response> createProduct(Product product) async {
    String? token = await _storage.read(key: 'token');
    if (token == null) throw Exception('Token not found');

    var response = await http.post(
      Uri.parse('$baseUrl/api/v1/product'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'tag': product.tag,
      }),
    );
    return response;
  }

  Future<http.Response> updateProduct(Product product) async {
    String? token = await _storage.read(key: 'token');
    if (token == null) throw Exception('Token not found');

    var response = await http.put(
      Uri.parse('$baseUrl/api/v1/product/${product.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'tag': product.tag,
      }),
    );
    return response;
  }

  Future<http.Response> deleteProduct(String productId) async {
    String? token = await _storage.read(key: 'token');
    if (token == null) throw Exception('Token not found');

    var response = await http.delete(
      Uri.parse('$baseUrl/api/v1/product/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }
}
