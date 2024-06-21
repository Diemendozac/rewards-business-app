class BusinessCredentials {
  String username;
  String email;
  String? password;

  BusinessCredentials(this.username, this.email, this.password);

  factory BusinessCredentials.fromJson(Map<String, dynamic> json) {
    return BusinessCredentials(
      json['username'] as String,
      json['email'] as String,
      json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
