
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import 'database.dart';

class AuthentificationService with ChangeNotifier{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? UserFromFirebase(User user)
  {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user{
    return _auth.authStateChanges().map((User? user) => UserFromFirebase(user!));
  }

  Future signInWithEmailAndPassword(String email , String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

   Future registerInWithEmailAndPassword(String name, String email , String password,String phone, String ville, String quartier) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword( email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).SaveUser(name,email,password,phone,ville,quartier);
      return UserFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  Future signOut() async{
    try {

     return _auth.signOut();
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  Future SendEmailResetPassword(String email) async{
    try{
        return await _auth.sendPasswordResetEmail(email: email);
    }catch(e)
    {
      print(e.toString());
      return null;

    }

  }

}