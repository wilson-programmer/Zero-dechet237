// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/models/argument_compte.dart';

import 'global.dart';



class ClientRamasseur extends StatefulWidget {
  const ClientRamasseur({super.key});

  @override
  State<ClientRamasseur> createState() => _ClientRamasseurState();
}

class _ClientRamasseurState extends State<ClientRamasseur> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference ramasseur =  FirebaseFirestore.instance.collection("ramasseurs");
  final CollectionReference collection =  FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {

     User? currentUser = _auth.currentUser;
    final size = MediaQuery.of(context).size;

     return  Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: ramasseur.doc(currentUser!.email).get(),
            builder: (context, snapshot){
              

              if(snapshot.hasData){
                Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;
      

    return Scaffold(
        appBar: AppBar(
        title: const Text("Liste des clients", style: TextStyle(color: Colors.white),),
        backgroundColor:Color(0xFF188C74),
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/dashbord_ram'),
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
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ram.png'),
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
                        children:  [
                          // ignore: prefer_adjacent_string_concatenation
                          Text("M."+" "+documentData['name']+" "+"Consulter le profil de vos clients", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

               
              Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                print(data['ramasseur']);
                print(documentData['name']+"\n"+documentData['quartier']);
                
                if((documentData['name']+"\n"+documentData['quartier']) == data['ramasseur']){

                  
                 return Container(
                  width: size.width,
                  
                  margin: EdgeInsets.all(8),
                 // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF188C74)),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                   child: ListTile(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/conversation', arguments: ArgumentId(send: data['phone'],receive:documentData['email'] ));
                    },
                    // ignore: prefer_interpolation_to_compose_strings
                    title: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text("M."+" "+data['nom']+" "+data['prenom'], style: TextStyle(fontSize: 20, letterSpacing: 1,fontWeight: FontWeight.w500),),
                    ),
                   // SizedBox(height: 3,),
                    subtitle: Text(data['ville']+" "+data['locality'], style: TextStyle(fontSize: 16, letterSpacing: 1,fontWeight: FontWeight.w500)),
                                 ),
                 );
                }
                else{
                   return CircularProgressIndicator();
                }
                
                
                
              
              }).toList(),

          
            );
          
          }
        },
      ),
    
                ],
              )
          ],
        ),
      ),
    );

     }

     else if(snapshot.hasError){

            WidgetsBinding.instance.addPostFrameCallback((_) {    
            Navigator.pushReplacementNamed(context,'/compte' );
            });
            ValideSnackBar(context, "Vous n'avez pas encore de compte");
            
                     
     }

      return const Scaffold(
                body:  Center(child: CircularProgressIndicator()),
              );
                                      

            }
          )
        ],
      );
  }
}