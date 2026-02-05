import 'package:flutter/material.dart';
import 'package:theka/features/auth/pages/signUp/contractor_details.dart';
import 'package:theka/model/register_request.dart';
import 'package:theka/model/user_profile.dart';
import 'package:theka/service/authService.dart';

import '../../../../model/enums.dart';

class UserDetails extends StatefulWidget {
  final AuthService authService;
  final String email;
  final String password;
  const UserDetails(
      {super.key,
      required this.authService,
      required this.password,
      required this.email});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _phone;
  String? _address;
  String? _profilePicUrl;
  String? _bio;
  UserRole? role;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.05,
                  horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter name'),
                    validator: (val) =>
                        val!.isNotEmpty ? null : 'Enter a valid name',
                    onChanged: (val) => setState(() => _name = val),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter phone',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (val) =>
                        val!.length == 10 ? null : 'Enter a valid phone number',
                    onChanged: (val) => setState(() => _phone = int.parse(val)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Enter address'),
                    validator: (val) =>
                        val!.isNotEmpty ? null : 'Enter a valid address',
                    onChanged: (val) => setState(() => _address = val),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter bio'),
                    validator: (val) =>
                        val!.isNotEmpty ? null : 'Enter a valid bio',
                    onChanged: (val) => setState(() => _bio = val),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  DropdownButtonFormField<UserRole>(
                    hint: const Text('Select Role'),
                    validator: (val) => val == null ? 'select role' : null,
                    items: UserRole.values
                        .map((role) => DropdownMenuItem(
                              value: role,
                              child: Text(role.name == 'CLIENT' ? 'Client' : 'Contractor'),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => role = value),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          UserProfile userProfile=UserProfile(name: _name!, phone: _phone!, address: _address!, bio: _bio!);
                          //Creating RegisterRequest for API call
                          final request= RegisterRequest(
                              email: widget.email, password: widget.password, role: role, profile: userProfile);

                          if(role == UserRole.CLIENT){
                            await widget.authService.register(request: request);
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContractorDetails(
                                  request: request,
                                  authService: widget.authService,
                                ))
                            );
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
