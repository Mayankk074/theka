import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theka/features/auth/pages/signUp/user_details.dart';
import 'package:theka/features/wrapper.dart';
import 'package:theka/service/authService.dart';
import 'package:theka/theme/theme.dart';

import 'features/auth/pages/signIn/signIn.dart';
import 'features/auth/pages/signUp/sign_up.dart';
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
          '/signIn': (context) => SignIn(authService: widget.authService,),
          '/signUp' : (context) => SignUp(authService: widget.authService),
        },
      ),
    );
  }
}





