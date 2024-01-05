// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
       child: SpinKitChasingDots(
          color:  Color(0xFF188C74) ,
          size: 40,)
       )
    );
  }
}


class Chargement extends StatelessWidget {
  const Chargement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Center(
       child: SpinKitFadingCircle(
          color: Color(0xFF188C74) ,
          size: 40,)
       )
    );
  }
}