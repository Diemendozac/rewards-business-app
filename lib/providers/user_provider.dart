import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user.dart';
import '../models/business.dart';
import '../models/product.dart';
import '../models/user_data.dart';


class UserProvider extends ChangeNotifier {
  User? user;
  Business? business;
  List<Product>? products;
  final UserService userService = UserService();

  UserProvider._();

  static UserProvider instance = UserProvider._();

  Future<dynamic> findLoggedInUser() async {
    var response = await userService.findAllUserData();
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body);
      try {
        UserData userData = UserData.fromJson(mapData);
        user = userData.user;
        business = userData.business;
        products = userData.business.products;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }

    return response;
  }
}
