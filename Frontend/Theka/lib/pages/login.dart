import 'package:flutter/material.dart';
import 'package:theka/service/authService.dart';
import 'package:theka/shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0,400.0,0,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    AuthService().login('ashok@gmail.com', 'test123');
                  },
                  style: buttonStyle,
                  child: Text('Sign Up'),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: (){},
              style: buttonStyle,
              child: Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
