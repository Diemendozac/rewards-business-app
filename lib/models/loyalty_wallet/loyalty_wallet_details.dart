
import '../gift_card.dart';

class LoyaltyWalletDetails {
  int loyaltyPoints;
  List<GiftCard> giftCards;

  LoyaltyWalletDetails(this.loyaltyPoints, this.giftCards);

  factory LoyaltyWalletDetails.fromJson(Map<String, dynamic> json) {
    return LoyaltyWalletDetails(
      json['loyaltyPoints'] as int,
      []
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loyaltyPoints'] = loyaltyPoints;
    data['giftCards'] = giftCards.map((card) => card.toJson()).toList();
    return data;
  }
}
