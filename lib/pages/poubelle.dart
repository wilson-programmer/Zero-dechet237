// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/argument_compte.dart';
import 'global.dart';
import 'navigation_drawer.dart';



class Poubelle extends StatefulWidget {
  const Poubelle({super.key});

  @override
  State<Poubelle> createState() => _PoubelleState();
}

class _PoubelleState extends State<Poubelle> {

  final CollectionReference user =  FirebaseFirestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as Argument;
    final size = MediaQuery.of(context).size;
    User? currentUser = _auth.currentUser;
  
  return Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: user.doc(currentUser!.phoneNumber).get(),
            builder: (context, snapshot){
              

              if(snapshot.hasData){
                Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;
      
    
    return Scaffold(
      drawer:  NavigationDrawers(),
      appBar : AppBar(
        iconTheme: IconThemeData(color: Color(0xFF188C74)),
        title: Text("Dashbord Client", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
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
                        child: Text("Gere tes déchets et évite la pollution de l’environnement", style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                      SizedBox(height: 5,),
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
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDD287),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(top:16.0,left: 5),
                    child: Text("M."+" "+documentData['nom']+" "+documentData['prenom']+","+" "+"soyez un modèle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const  EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Pour une société plus propre, cas la propreté ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 5),
                    child: Text( "D'une ville commence par nos ménages",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                  ],
                 ),
                ),
              ),


              const SizedBox(height: 20,),

              Text("Niveau actuel de votre poubelle", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            
              const SizedBox(height: 15,),

              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  color: Colors.white,
                  border: Border.all(
                    width: 3,
                    color: Color(0xFF188C74)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 29.0),
                  child: Text(documentData['lastObservation']+"%", style: TextStyle(color: Color(0xFF188C74), fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
              ),

              SizedBox(height: 10,)

            
            
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