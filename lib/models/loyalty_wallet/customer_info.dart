class CustomerInfo {
  String customerId;
  String firstName;
  String lastName;
  String? birthDate;
  String idDocument;
  String? documentType;
  String? countryCode;
  String? phoneNumber;

  CustomerInfo(
      this.customerId,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.idDocument,
      this.documentType,
      this.countryCode,
      this.phoneNumber,
      );

  factory CustomerInfo.fromJson(Map<String, dynamic> json) {
    return CustomerInfo(
      json['customerId'].toString(),
      json['firstName'] as String,
      json['lastName'] as String,
      json['birthDate'] as String?,
      json['idDocument'] as String,
      json['documentType'] as String?,
      json['countryCode'] as String?,
      json['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthDate'] = birthDate;
    data['idDocument'] = idDocument;
    data['documentType'] = documentType;
    data['countryCode'] = countryCode;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
