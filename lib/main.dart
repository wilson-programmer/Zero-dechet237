import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/pages/compte_client.dart';
import 'package:zero_dechet_237/pages/compte_client1.dart';
import 'package:zero_dechet_237/pages/condition.dart';
import 'package:zero_dechet_237/pages/condition1.dart';
import 'package:zero_dechet_237/pages/connexion_client.dart';
import 'package:zero_dechet_237/pages/connexion_ramasseur.dart';
import 'package:zero_dechet_237/pages/contact_ram.dart';
import 'package:zero_dechet_237/pages/conversation.dart';
import 'package:zero_dechet_237/pages/dashbord_ram.dart';
import 'package:zero_dechet_237/pages/forget_password.dart';
import 'package:zero_dechet_237/pages/poubelle.dart';
import 'package:zero_dechet_237/pages/ramasseur.dart';
import 'package:zero_dechet_237/pages/ramasseur1.dart';
import 'package:zero_dechet_237/pages/splash.dart';
import 'package:zero_dechet_237/pages/verify.dart';
import 'package:zero_dechet_237/pages/verify_otp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

   final FirebaseAuth _auth = FirebaseAuth.instance;

  // This widget is the root of your application.
   
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StreamBuilder<User?>(
      //     stream: _auth.authStateChanges(),
      //     builder:(context, snapshot){
      //         return snapshot.data ==null ? const ConnexionClient() : const Poubelle();
      //     }
      //   ),     //,,
      home:  const SplashScreen(),
      initialRoute: '/splash',
      routes:  {
        '/splash' :(context) => const SplashScreen(),
        '/compte' :(context) => const CompteClient(),
        '/compte1' :(context) => const CompteClient1(),
        '/connexion' :  (context) => const ConnexionClient(),
        '/poubelle' :(context) => const Poubelle(),
        '/verify' :(context) => const Verify(),
        '/verifyotp' :(context) => const VerifyOtp(),
        '/ram' :(context) => const Ramasseur(),
        '/ram1' :(context) => const Ramasseur1(),
        '/forget' :(context) => const ForgetPassword(),
        '/dashbord_ram' :(context) => const DashbordRamasseur(),
        '/connexion_ram' :(context) => const ConnexionRamasseur(),
        '/contact_ram' :(context) => const ContactRam(),
        '/conversation' :(context) => const Conversation(),
        '/condition' :(context) => const ConditionGenerale(),
        '/condition1' :(context) => const ConditionGenerale1(),
      },
    );
  }
}
