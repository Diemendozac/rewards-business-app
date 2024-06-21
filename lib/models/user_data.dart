
import 'package:loyalty_business_project/models/user.dart';

import 'business.dart';

class UserData {
  User user;
  Business business;

  UserData({
    required this.user,
    required this.business,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      business: Business.fromJson(json['business']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'business': business.toJson(),
    };
  }
}
