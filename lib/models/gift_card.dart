class GiftCard {
  String? giftCardType;
  String giftCardId;
  DateTime? createdAt;
  String balance;

  GiftCard(
      this.giftCardType,
      this.giftCardId,
      this.createdAt,
      this.balance,
      );

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    return GiftCard(
      json['giftCardType'] as String?,
      json['giftCardId'] as String,
      json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      json['balance'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['giftCardType'] = giftCardType;
    data['giftCardId'] = giftCardId;
    data['createdAt'] = createdAt?.toIso8601String();
    data['balance'] = balance;
    return data;
  }
}
