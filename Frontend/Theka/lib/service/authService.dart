

import 'dart:async';
import 'dart:convert';
import 'package:theka/model/register_request.dart';
import 'package:theka/service/storageHelper.dart';
import '../model/user.dart';
import '../model/user_profile.dart';
import '../shared/constants.dart';
import 'package:http/http.dart' as http;

class AuthService{

  final _authStateController = StreamController<User?>.broadcast();

  Stream<User?> get authStateChanges => _authStateController.stream;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );


    if (response.statusCode == 200) {
      print('hello');
      final data = jsonDecode(response.body);
      final token = data['token'];
      //storage
      await SecureStorageHelper.setToken(token);
      final user = User.fromJson(data['user']);
      _authStateController.add(user);
    } else {
      throw Exception('Login failed');
    }
  }

  Future<void> register({required RegisterRequest request}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data['user']);
      print("${user.userProfile?.id} , ${user.userProfile?.phone}");
      _authStateController.add(user);
    } else {
      throw Exception('Login failed');
    }
  }
}