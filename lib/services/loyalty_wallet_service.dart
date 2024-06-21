
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'local_storage.dart';


class LoyaltyWalletService {

  final String baseUrl = LocalStorage.prefs.getString('baseUrl')!;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<dynamic> findCostumerWallet(String id) async {

    String? token = await _storage.read(key: 'token');
    var response = await http.get(
      Uri.parse('$baseUrl/api/v1/loyalty-wallet/business/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }

  Future<dynamic> enrollLoyaltyWallet(String id) async {

    String? token = await _storage.read(key: 'token');
    var response = await http.post(
      Uri.parse('$baseUrl/api/v1/loyalty-wallet/business/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }

}
