import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService{

  String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("ramasseurs");

  // ignore: non_constant_identifier_names
  Future<void> SaveUser(String name, String email, String password, String phone, String ville, String quartier) async{

    return await userCollection.doc(email.toString()).set({
      
      'name' : name,
      'email' : email,
      'password' : password,
      'phone' : phone,
      'ville' : ville,
      'quartier' : quartier,

    });

  }

 


  AppUserData _userFromSnapshot(DocumentSnapshot snapshot){

    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return AppUserData(
      uid: uid,
      nom: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      phone: data['phone'],
      ville: data['ville'] ?? '',
      quartier: data['quartier'] ?? '',
    
      );
  }


  Stream<AppUserData> get user{
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  Iterable<AppUserData> _userListFromSnapshot(QuerySnapshot snapshot){
    
    return snapshot.docs.map((doc) {
      return AppUserData(
        uid: uid, 
        nom: doc.get('name'),
        email: doc.get('email'),
        password: doc.get('password'),
        phone: doc.get('phone'),
        ville: doc.get('ville'),
        quartier: doc.get('quartier'),
        );
    });
  }

  
  Stream<Iterable<AppUserData>> get users{
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  
}
