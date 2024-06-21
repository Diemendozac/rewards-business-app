
class CustomerUser {
  String firstName;
  String lastName;
  DateTime? birthDate;
  String? idDocument;
  String? documentType;
  String? countryCode;
  String? phoneNumber;

  CustomerUser({
    required this.firstName,
    required this.lastName,
    this.birthDate,
    this.idDocument,
    this.documentType,
    this.countryCode,
    this.phoneNumber,
  });

  factory CustomerUser.fromJson(Map<String, dynamic> json) => CustomerUser(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    birthDate: json['birthDate'] != null
        ? DateTime.parse(json['birthDate'] as String)
        : null,
    idDocument: json['idDocument'] as String?,
    documentType: json['documentType'] as String?,
    countryCode: json['countryCode'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'birthDate': birthDate?.toIso8601String(),
    'idDocument': idDocument,
    'documentType': documentType,
    'countryCode': countryCode,
    'phoneNumber': phoneNumber,
  };

  // Optional: To string method for easier debugging
  @override
  String toString() {
    return 'CustomerUser{firstName: $firstName, lastName: $lastName, birthDate: $birthDate, idDocument: $idDocument, documentType: $documentType, countryCode: $countryCode, phoneNumber: $phoneNumber}';
  }
}