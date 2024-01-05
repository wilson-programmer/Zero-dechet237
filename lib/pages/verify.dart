// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zero_dechet_237/pages/compte_client1.dart';
import 'package:zero_dechet_237/pages/connexion_client.dart';

import '../models/argument_compte.dart';
import 'global.dart';
import 'loading.dart';



class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<Verify> {

  bool loading = false;

  //  final defaultPinTheme = PinTheme(
  //     width: 56,
  //     height: 56,
  //     textStyle: const TextStyle(
  //       fontSize: 22,
  //       color: Color.fromRGBO(30, 60, 87, 1),
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(19),
  //      // border: Border.all(color: borderColor),
  //     ),
  //   );


  final FirebaseAuth _auth = FirebaseAuth.instance;
  var code;
  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as ArgumentCompte1;
    return loading ? Loading() :Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Verification Otp", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF188C74),
       // elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/splash'),
           icon: const Icon(Icons.arrow_back_ios_new))
        //automaticallyImplyLeading: false
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2,),
                    Container(
                  //margin: EdgeInsets.all(2),
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/otp.png'),
                      fit: BoxFit.cover 
                      )
                  ),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
              
                     decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF188C74).withOpacity(.9),
                                            Color(0xFFB6E1D8).withOpacity(.1)
                                          ])
                                      ),
                    
                    child: Padding(padding: EdgeInsets.only(top:200),
                      child: Column(
                        children:const  [
                          Text("Valider le code otp ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),



               SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Pinput(
                  length: 6,
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
              
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                  onChanged: (value){
                    code = value;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async{
                        setState(()=> loading = true);
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: ConnexionClient.verify,
                                smsCode: code);
                        await _auth.signInWithCredential(credential);
                        User? currentUser = _auth.currentUser;
                       
                               Navigator.pushReplacementNamed(context, '/poubelle');
                           // ValideSnackBar(context, 'Connexion reussit avec succès');
                 
                        
              
                           
                  
              
                      },
                      child: Text("Vérification")),
                ),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed: () {
                        
              //         },
              //         child: Text(
              //           "Edit Phone Number ?",
              //           style: TextStyle(color: Colors.black),
              //         ))
              //   ],
              // )
            




          ],
        ),
      ),
    );
  }
}