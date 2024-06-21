class CostumerRequest {
  String firstName;
  String lastName;
  String email;
  String username;
  String password;
  String documentId;
  String documentType;
  String countryCode;
  String phoneNumber;
  String birthDay;

  CostumerRequest(
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.password,
      this.documentId,
      this.documentType,
      this.countryCode,
      this.phoneNumber,
      this.birthDay);

  // Método para convertir un mapa (Map<String, dynamic>) a una instancia de CostumerRequest
  factory CostumerRequest.fromJson(Map<String, dynamic> json) {
    return CostumerRequest(
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['username'] as String,
      json['password'] as String,
      json['documentId'] as String,
      json['documentType'] as String,
      json['countryCode'] as String,
      json['phoneNumber'] as String,
      json['birthDay'] as String,
    );
  }

  // Método para convertir una instancia de CostumerRequest a un mapa (Map<String, dynamic>)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'password': password,
      'documentId': documentId,
      'documentType': documentType,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'birthDay': birthDay,
    };
  }
}
