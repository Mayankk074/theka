import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theka/pages/auth/authenticate.dart';
import 'package:theka/pages/auth/wrapper.dart';
import 'package:theka/service/authService.dart';
import 'package:theka/theme/theme.dart';

import 'model/user.dart';


void main() => runApp(MyApp(authService: AuthService(),));

class MyApp extends StatefulWidget {
  final AuthService authService;
  const MyApp({super.key, required this.authService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: widget.authService.authStateChanges,
      initialData: null,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(authService: widget.authService),
        },
      ),
    );
  }
}





