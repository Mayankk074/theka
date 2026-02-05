import 'package:flutter/material.dart';
import 'package:theka/service/authService.dart';

import '../../../../model/enums.dart';
import '../../../../model/register_request.dart';

class ContractorDetails extends StatefulWidget {
  final RegisterRequest request;
  final AuthService authService;
  const ContractorDetails({super.key, required this.request, required this.authService});

  @override
  State<ContractorDetails> createState() => _ContractorDetailsState();
}

class _ContractorDetailsState extends State<ContractorDetails> {
  int? _experience;
  String? _skills;
  ServiceType? _serviceType;
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contractor Details'),
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
                  decoration: const InputDecoration(hintText: 'Enter skills'),
                  validator: (val) =>
                  val!.isNotEmpty ? null : 'Enter valid skills',
                  onChanged: (val) => setState(() => _skills = val),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                DropdownButtonFormField<int>(
                  hint: const Text('Select experience in years'),
                  validator: (val) => val == null ? 'select year(s)' : null,
                  items: [1, 2, 3, 4]
                      .map((year) => DropdownMenuItem(
                    value: year,
                    child: Text('$year Year(s)'),
                  ))
                      .toList(),
                  onChanged: (year) => setState(() => _experience = year),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                DropdownButtonFormField<ServiceType>(
                  hint: const Text('Select service type'),
                  validator: (val) => val == null ? 'select service type' : null,
                  items: ServiceType.values
                      .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.name),
                  ))
                      .toList(),
                  onChanged: (type) => setState(() => _serviceType = type),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()async {
                      if(_formKey.currentState!.validate()){
                        //Updating request with new values for contractor
                        widget.request.profile?.experienceYears=_experience;
                        widget.request.profile?.serviceType=_serviceType;
                        widget.request.profile?.skills=_skills;
                        //Creating an account
                        await widget.authService.register(request: widget.request);
                      }
                    },
                    child: const Text('Submit')),
                )
              ],
            ),
          )),
      )
    );
  }
}
