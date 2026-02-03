import 'package:flutter/material.dart';
import 'package:theka/features/auth/pages/signUp/user_details.dart';
import 'package:theka/service/authService.dart';

class SignUp extends StatefulWidget {
  final AuthService authService;
  const SignUp({super.key, required this.authService});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey=GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight* 0.2, horizontal: screenWidth*0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter email'
                  ),
                  validator: (val) => val!.contains('@') ? null : 'Enter a valid email',
                  onChanged: (val) => setState(() => email=val),
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter password',
                  ),
                  obscureText: true,
                  validator: (val) => val!.isNotEmpty ? null : 'Enter a password',
                  onChanged: (val) => setState(() => password=val),
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Confirm password'
                  ),
                  obscureText: true,
                  validator: (val) => val == password ? null : 'Enter a password',
                ),
                SizedBox(height: screenHeight * 0.02,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(
                              authService: widget.authService,
                              email: email!,
                              password: password!,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
