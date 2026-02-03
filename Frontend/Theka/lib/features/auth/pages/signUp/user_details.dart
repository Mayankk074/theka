import 'package:flutter/material.dart';
import 'package:theka/model/user_profile.dart';
import 'package:theka/service/authService.dart';

class UserDetails extends StatefulWidget {
  final AuthService authService;
  final String email;
  final String password;
  const UserDetails({super.key, required this.authService, required this.password, required this.email});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey=GlobalKey<FormState>();

  String? _name;
  int? _phone;
  String? _address;
  String? _profilePicUrl;
  String? _bio;

  int? _experience;
  String? _skills;
  String? _serviceType;

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('User Details'),),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight* 0.05, horizontal: screenWidth*0.04),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter name'
                  ),
                  validator: (val) => val!.isNotEmpty ? null : 'Enter a valid name',
                  onChanged: (val) => setState(() => _name=val),
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter phone',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (val) => val!.length == 10 ? null : 'Enter a valid phone number',
                  onChanged: (val) => setState(() => _phone= int.parse(val)),
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter address'
                  ),
                  validator: (val) => val!.isNotEmpty ? null : 'Enter a valid address',
                  onChanged: (val) => setState(() => _address= val),
                ),
                SizedBox(height: screenHeight * 0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter bio'
                  ),
                  validator: (val) => val!.isNotEmpty ? null : 'Enter a valid bio',
                  onChanged: (val) => setState(() => _bio = val),

                ),
                SizedBox(height: screenHeight * 0.02,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        await widget.authService.register(
                            email: widget.email, password: widget.password, role: 'CONTRACTOR', // role will be from dropdown
                            profile: UserProfile(name: _name!, phone: _phone!, address: _address!, bio: _bio!)
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
