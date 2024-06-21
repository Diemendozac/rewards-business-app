import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/loyalty_wallet/customer_info.dart';
import '../models/loyalty_wallet/loyalty_wallet.dart';
import '../models/loyalty_wallet/loyalty_wallet_details.dart';
import '../services/loyalty_wallet_service.dart';

class LoyaltyWalletProvider extends ChangeNotifier {
  final loyaltyWalletService = LoyaltyWalletService();
  LoyaltyWallet? loyaltyWallet;

  LoyaltyWalletProvider._();

  static LoyaltyWalletProvider instance = LoyaltyWalletProvider._();

  Future<dynamic> findLoyaltyWallet(String id) async {
    var response = await loyaltyWalletService.findCostumerWallet(id);
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body);
      try {
        loyaltyWallet = LoyaltyWallet(CustomerInfo.fromJson(mapData['customer']),
            LoyaltyWalletDetails.fromJson(mapData['loyaltyWallet']));
        notifyListeners();
      } on Exception catch (e) {
        print(e);
      }
    }
    return response.statusCode;
  }

  Future<dynamic> enrollLoyaltyWallet(String id) async {
    var response = await loyaltyWalletService.enrollLoyaltyWallet(id);
    return response.statusCode;

  }


}
