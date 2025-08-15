import 'package:flutter/material.dart';

var buttonStyle=ButtonStyle(
  fixedSize: WidgetStateProperty.all<Size>(const Size(250,50)),
  backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow[300]!),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  side: WidgetStateProperty.all<BorderSide>(const BorderSide(
    color: Colors.white,
    width: 2.0,
  )),
  // foregroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(47, 147, 137, 1.0))
  foregroundColor: WidgetStateProperty.all<Color>(const Color(0xff510D0A)),
);

String baseUrl='http://192.168.1.7:8080';