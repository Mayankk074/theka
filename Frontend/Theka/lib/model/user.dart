import 'package:theka/model/user_profile.dart';
import 'package:theka/model/user_role.dart';

class User{
  int? id;
  String? email;
  UserRole? role;

  UserProfile? userProfile;

  User({this.id, this.email, this.userProfile, this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      role: UserRole.values.firstWhere(
            (e) => e.name == json['role'],
      ), // converting String -> enum UserRole
      userProfile: UserProfile.fromJson(json['userProfile'])
    );
  }
}