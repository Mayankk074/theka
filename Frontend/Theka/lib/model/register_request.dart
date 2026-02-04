import 'package:theka/model/user_profile.dart';
import 'package:theka/model/user_role.dart';

class RegisterRequest{
  final String email;
  final String password;
  final UserRole? role;
  final UserProfile? profile;

  RegisterRequest({
    required this.email,
    required this.password,
    this.role,
    this.profile,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "role": role?.name, // enum UserRole → string
      if (profile != null) "profile": profile!.toJson(),
    };
  }
}