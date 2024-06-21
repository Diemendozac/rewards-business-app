
class BusinessDetails {
  String businessId;
  String name;
  String businessType;
  String? logoUrl;
  String? description;

  BusinessDetails(
      this.businessId,
      this.name,
      this.businessType,
      this.logoUrl,
      this.description,
      );

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return BusinessDetails(
      json['businessId'].toString(),
      json['name'] as String,
      json['businessType'] as String,
      json['logoUrl'] as String?,
      json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['businessId'] = businessId;
    data['name'] = name;
    data['businessType'] = businessType;
    data['logoUrl'] = logoUrl;
    data['description'] = description;
    return data;
  }
}
