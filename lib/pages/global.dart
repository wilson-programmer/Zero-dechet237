import 'package:flutter/material.dart';

erroSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(

    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 5),
  ));
}


ValideSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(

    backgroundColor: Colors.green,
    content: Text(text),
    duration: const Duration(seconds: 5),
  ));
}