

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/auth_service.dart';

class TokenProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  String? token;

  Future<dynamic> saveToken(String email, String password) async {
    final response = await authService.loginUser(email, password);
    const FlutterSecureStorage storage = FlutterSecureStorage();

    if (response.statusCode == 200) {
      Map<String, dynamic> tokenMap = jsonDecode(response.body);
      await storage.write(key: 'token', value: tokenMap['token']);
      notifyListeners();
      return response;

    }

    return response;

  }
}