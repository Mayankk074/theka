import 'package:flutter/material.dart';

class ContractorDetails extends StatefulWidget {
  const ContractorDetails({super.key});

  @override
  State<ContractorDetails> createState() => _ContractorDetailsState();
}

class _ContractorDetailsState extends State<ContractorDetails> {
  int? _experience;
  String? _skills;
  String? _serviceType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Contractor'),
      ),
    );
  }
}
