// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/argument_compte.dart';
import 'global.dart';



class ProfilRamasseur extends StatefulWidget {
  const ProfilRamasseur({super.key});

  @override
  State<ProfilRamasseur> createState() => _ProfilRamasseurState();
}

class _ProfilRamasseurState extends State<ProfilRamasseur> {
    final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference ramasseur =  FirebaseFirestore.instance.collection("ramasseurs");
  final CollectionReference collection =  FirebaseFirestore.instance.collection("users");

  late  String email = '';
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    User? currentUser = _auth.currentUser;

      return  Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: collection.doc(currentUser!.phoneNumber).get(),
            builder: (context, snapshot){
              

              if(snapshot.hasData){
                Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;

    return Scaffold(
       appBar : AppBar(
        //iconTheme: IconThemeData(color: Color(0xFF188C74)),
        title: Text("Profil De Son Ramasseur", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
       // title: Image.asset('assets/'),
        backgroundColor : Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/poubelle'),
           icon: const Icon(Icons.arrow_back_ios_new, color:  Color(0xFF188C74),))
       
      ),
      body: Container(
        height:double.maxFinite,
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

               Text("Profil de votre ramasseur", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           
          const SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: Container(
            width: double.infinity,
            child: Row(
              children: [


                 Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
        stream: ramasseur.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                print(data['name']+"\n"+data['quartier']+"top");
                email = data['email'];
                print(documentData['ramasseur']);
                if((data['name']+"\n"+data['quartier']) == documentData['ramasseur']){
                 return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Text("Nom: M."+" "+data['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 15,),
                            Text("Ville :"+" "+data['ville'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 15,),
                            Text("Phone  :"+" "+data['phone'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 15,),
                            Text("Quartier  :"+" "+data['quartier'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                 
                 
                 
                 
                  
                 
                  ],
                 
                 
                );
                }
                return CircularProgressIndicator();
                
                
              
              }).toList(),

          
            );
          
          }
        },
      ),
    
                ],
              ),










              
                    Expanded(child: Image.asset('assets/ram.png')),
              ],
            ),
          ),
        ),


                    const SizedBox(height: 10,),
                  Text("Description du ramasseur", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
const SizedBox(height: 10,),
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
                    child: Text("Je suis citoyen camerounais et j’aimerais",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const  EdgeInsets.only(top:8.0,left: 5),
                    child: Text("Bien participer cette opération de façon",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 5),
                    child: Text("A rendre propre notre pays",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                    ,),
                  ),
                  ],
                 ),
                ),
              ),
              SizedBox(height: 10,),

               Text("Noter votre ramasseur", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
const SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //alignment: Alignment.center,
                      width: double.infinity,
                      child: Rating(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6, bottom: 6),
                    child: Align(
                     alignment: Alignment.bottomRight,
                     
                         child: FloatingActionButton(
                         onPressed: () {Navigator.pushReplacementNamed(context, '/conversation', arguments: ArgumentId(send: documentData['phone'], receive: email));},
                         child: const Icon(Icons.send, color: Colors.white,),
                         backgroundColor: Color(0xFF188C74)
                                      ),
                       
                                  ),
                  ),
                 

               

                 
         






            ]
        ),
      )
      )
   
    );

     }

     else if(snapshot.hasError){

            WidgetsBinding.instance.addPostFrameCallback((_) {    
            Navigator.pushReplacementNamed(context,'/compte' );
            });
            erroSnackBar(context, "Vous n'avez pas encore de compte");
            
                     
     }

      return const Scaffold(
                body:  Center(child: CircularProgressIndicator()),
              );
                                      

            }
          )
        ],
      );
  }

    RatingBar Rating() {
    return RatingBar.builder(
 initialRating: 3,
 minRating: 1,
 direction: Axis.horizontal,
 allowHalfRating: true,
 itemCount: 5,
 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
 itemBuilder: (context, _) => Icon(
   Icons.star,
   color: Color(0xFF188C74),
 ),
 onRatingUpdate: (rating) {
   print(rating);
 },
);
  }
}