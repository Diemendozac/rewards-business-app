

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../http/request/costumer_request.dart';
import 'local_storage.dart';

class AuthService {

  final String baseUrl = LocalStorage.prefs.getString('baseUrl')!;

  Future<dynamic> loginUser(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/v1/auth/login/business'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(
            <String, Object?>{
              'username': email,
              'password': password,
            }),
      );

      return response;
    } on Exception catch (e) {
      return {'statusCode': 500, 'message': e.toString()};
    }
  }

  Future<dynamic> registerUser(CostumerRequest costumerRequest) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/v1/auth/register-business'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(
            <String, Object?>{
              'firstName': costumerRequest.firstName,
              'lastName': costumerRequest.lastName,
              'email': costumerRequest.email,
              'username': costumerRequest.username,
              'password': costumerRequest.password,
              'documentId': costumerRequest.documentId,
              'documentType': costumerRequest.documentType,
              'countryCode': costumerRequest.countryCode,
              'phoneNumber': costumerRequest.phoneNumber,
              'birthDay': costumerRequest.birthDay,
            }),
      );

      return response;
    } on Exception catch (e) {
      return {'statusCode': 500, 'message': e.toString()};
    }
  }

}