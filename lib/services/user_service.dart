import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'local_storage.dart';


class UserService {

  final String baseUrl = LocalStorage.prefs.getString('baseUrl')!;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> saveUser(String email, String password, String name, String? photo ) async {

    String photoUrl = photo ?? 'null';
    var response = await http.post(
      Uri.parse('$baseUrl/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(
          <String, Object?>{
        'email': email,
        'password': password,
        'name': name,
        'photoUrl': photoUrl,
        'phoneNumber': null,
        'confidenceCircle': []
      }),
    );
    return response.statusCode == 200 ? true : false;

  }

  Future<dynamic> loginUser(String email, String password) async {

    var response = await http.post(
      Uri.parse('$baseUrl/authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(
          <String, Object?>{
            'email': email,
            'password': password,
          }),
    );
    return response;
  }

  Future<dynamic> findAllUserData() async {
    String? token = await _storage.read(key: 'token');
    if(token == null) return null;
    var response = await http.get(
      Uri.parse('$baseUrl/api/v1/business'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }
}
