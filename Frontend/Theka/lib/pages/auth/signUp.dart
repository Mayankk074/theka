import 'package:flutter/material.dart';
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
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screenWidth*0.04),
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
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter password'
                ),
                validator: (val) => val!.isNotEmpty ? null : 'Enter a password',
                onChanged: (val) => setState(() => password=val),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // if(_formKey.currentState!.validate()){
                    //   await widget.authService.register(email!, password!, userProfile);
                    //   SnackBar snackBar=const SnackBar(content: Text('User has been created'));
                    //   if(context.mounted){
                    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //     Navigator.pushReplacementNamed(context, '/signUp');
                    //   }
                    // }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
