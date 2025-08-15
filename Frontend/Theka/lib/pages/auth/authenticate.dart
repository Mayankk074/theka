import 'package:flutter/material.dart';
import 'package:theka/service/authService.dart';
import 'package:theka/shared/constants.dart';

class Authenticate extends StatefulWidget {
  final AuthService authService;
  const Authenticate({super.key, required this.authService});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0,400.0,0,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    widget.authService.login('ashok@gmail.com', 'test123');
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: (){},
              // style: buttonStyle,
              child: Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
