// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/models/argument_compte.dart';

import '../services/authentification.dart';
import 'global.dart';
import 'navigation_ram.dart';



class DashbordRamasseur extends StatefulWidget {
  const DashbordRamasseur({super.key});

  @override
  State<DashbordRamasseur> createState() => _DashbordRamasseurState();
}

class _DashbordRamasseurState extends State<DashbordRamasseur> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference ramasseur =  FirebaseFirestore.instance.collection("ramasseurs");
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Argument;
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
      drawer: NavigationRamasseur(),
      appBar : AppBar(
        iconTheme: IconThemeData(color: Color(0xFF188C74)),
        title: Text("Dashbord Ramasseur", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
       // title: Image.asset('assets/'),
        backgroundColor : Colors.white,
        elevation: 0,
        centerTitle: true,
       
      ),
      body: Container(
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
                   Row(
                children: [
                  Container(
                      width: size.width * 0.54,
                      height: 140,
                      margin: EdgeInsets.only(left: 8,right: 8,top: 8),
        
                       decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                          color: Color(0xFF188C74),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(100))
                                        
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Collectes les déchets pour un environnement plus propre", style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                     // SizedBox(height: 3,),
       Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
                                        //  padding:  const EdgeInsets.all(12),
                                            // color: Colors.deepOrange,
                                             height: 40,
                                             width: 110,
                                           decoration: BoxDecoration(
                                           border: Border.all(width: 3,  color: Colors.white),
                                            color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          
                    ),
                                                
                                          
                                                
                                             
                                            
                                             child: InkWell(
                                              
                                                hoverColor: Colors.orange,
                                                onTap: () async{
                                                
                              // print(currentUser.email!.trim());
                               print(documentData['email']);
                                             
                                             }, 
                                             child: const Padding(
                                               padding:  EdgeInsets.only(top:8.0),
                                               child:  Text("Savoir Plus", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),
                                             )
                                                        
                                             ),
                                           ),
        ),
      
                                      
                    ],
                  )
        
                  ),
                  Expanded(child: Image.asset('assets/dech2.png',width: 390,)),
                ],
              ),

              const SizedBox(height: 25,),

              Text("Comment ça marche ?", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           
              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Image.asset('assets/et1.png', width: 90,),
                    Image.asset('assets/et2.png', width: 90,),
                    Image.asset('assets/et3.png', width: 90,)
                ],
              ),

              const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("01", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
                        Text("Collecte\nd’ordure")
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("02",style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold)),
                        Text("Planification\nRamassage")
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("03",style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold)),
                        Text("Ramassage\nCollecte")
                      ],
                    )
                  ],
                ),
              ),


                const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDD287),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                   
                    Padding(
                    padding: const EdgeInsets.only(top:16.0,left: 5,right: 5),
                    // ignore: prefer_adjacent_string_concatenation
                    child: Text("Bienvenue M."+documentData['name']+" "+"ceci est votre espace membre.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const  EdgeInsets.only(top:5.0,left: 5,right: 5),
                    child: Text("Vous pouviez voir la liste de tous vos clients ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top:5.0,left: 5,right: 5),
                    child: Text( "echanger avec qu'eux et nous contatez si necessaire.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top:5.0,left: 5,right: 5),
                    child: Text( "Nous sommes ravis de vous avoir parmis nous.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                  ],
                 ),
                ),
              ),

            ],
          ),
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