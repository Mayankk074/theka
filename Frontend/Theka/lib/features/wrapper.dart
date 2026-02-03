import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theka/features/auth/pages/authenticate.dart';
import 'package:theka/service/authService.dart';

import '../model/user.dart';
import 'home/pages/home.dart';

class Wrapper extends StatelessWidget {
  final AuthService authService;
  const Wrapper({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User?>(context);
    return user != null ? const Home() : Authenticate(authService: authService,);
  }
}
