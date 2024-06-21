
import 'customer_info.dart';
import 'loyalty_wallet_details.dart';

class LoyaltyWallet {

  final CustomerInfo _customerInfo;
  final LoyaltyWalletDetails _loyaltyWalletDetails;

  LoyaltyWallet(this._customerInfo, this._loyaltyWalletDetails);

  LoyaltyWalletDetails get loyaltyWalletDetails => _loyaltyWalletDetails;

  CustomerInfo get customerInfo => _customerInfo;
}