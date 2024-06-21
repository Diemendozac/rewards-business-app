import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static final AuthState _instance = AuthState._internal();

  AuthState._internal();
  
  factory AuthState() => _instance;

  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void logOutUser() {
    _isLoggedIn = false;
    storage.delete(key: 'token');
    notifyListeners();
  }
}
