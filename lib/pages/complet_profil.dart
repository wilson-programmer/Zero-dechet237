// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, unused_local_variable, prefer_interpolation_to_compose_strings, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'global.dart';



class CompleteProfil extends StatefulWidget {
  const CompleteProfil({super.key});

  @override
  State<CompleteProfil> createState() => _CompleteProfilState();
}

class _CompleteProfilState extends State<CompleteProfil> {


  final CollectionReference user =  FirebaseFirestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference collection =  FirebaseFirestore.instance.collection("ramasseurs");
  String ramasseur = '';
  var jour = Jiffy.now().yMMMMd;
  var jourAfter = '';
  final _keyForm = GlobalKey<FormState>();
  String? value;
  String? value1;
  bool loading = false;
  final periode = ['3 Jours','5 Jours','7 Jours','10 Jours','14 Jours'];
  final items = ['carlos'];
  List<String> dataList = [];
final databaseReference = FirebaseFirestore.instance;
  Future<void> getData() async {
  await databaseReference.collection('ramasseurs').get().then((snapshot) {
    snapshot.docs.forEach((doc) {
      dataList.add((doc['name']+"\n"+doc['quartier']).toString());
      items.add(doc['name']);
    });
  });
}

@override
void initState() {
  super.initState();
  getData().then((value) {});
}

  var nom = '';
  @override
  Widget build(BuildContext context) {
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
      appBar : AppBar(
        //iconTheme: IconThemeData(color: Color(0xFF188C74)),
        title: Text("Compléter Son Profil", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
       // title: Image.asset('assets/'),
        backgroundColor : Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/poubelle'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF188C74),))
       
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

              const SizedBox(height: 30,),

               Text("Liste des ramasseurs", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           
              const SizedBox(height: 15,),



                 Container(
                            // decoration: const BoxDecoration(
                            //    color: Colors.white,
                            //    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                            // ),
                                      child: Padding(
                          padding: const EdgeInsets.all(20),
           child: SingleChildScrollView(
             child: Form(
                             key : _keyForm,
                             child: Column(
           
           
                               children: [
   Container(
                               width: 400,
                               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              
                              decoration: BoxDecoration(
                                color: Colors.white,
                              //  borderRadius: BorderRadius.circular(25),
                               border: Border.all( color: Colors.blueGrey, width: 1)
                    
                                
                              ),
                            
                              child: DropdownButtonHideUnderline(



                              
                              child: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF188C74)),
        iconSize: 36,
        hint:const  Text("Profil Ramasseur"),
        elevation: 16,
        //style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Color(0xFF188C74),
        ),
        //onChanged: (newValue) {},
        onChanged: (value) => setState(() => this.value = value),
        items: dataList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      
                              )





                                
                                // child: DropdownButton<String>(
                                //   value: value,
                                //   iconSize:36,
                                //   hint:const  Text("Profil Ramasseur"),
                                //   items: dataList.map(builMenuItem).toList(),
                                
                                // isExpanded: true,
                                // icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF188C74)),
                                // onChanged: (value) => setState(() => this.value = value)
                                // ),
                              ),
                             
                                  ),



           
                                
                       
                                  const SizedBox(height: 20,),


                                   Container(
                                   width: 400,
                                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  //  borderRadius: BorderRadius.circular(25),
                                   border: Border.all( color: Colors.blueGrey, width: 1)
                    
                                    
                                  ),
                                
                                  child: DropdownButtonHideUnderline(
                                    
                                    child: DropdownButton<String>(
                                      value: value1,
                                      iconSize:36,
                                      hint:const  Text("Periode Ramassage"),
                                      items: periode.map(builMenuItem1).toList(),
                                    
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF188C74)),
                                    onChanged: (value) => setState(() => this.value1 = value)
                                    ),
                                  ),
                                 
                ),

                        
        
                              
                            
                           

                                  const SizedBox(height: 20,),
                                       Container(
                                        //padding:  const EdgeInsets.all(20),
                                        // color: Colors.deepOrange,
                                         height: 48,
                                         width: double.maxFinite,
                                       decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                        color: Color(0xFF188C74),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      
                ),
                                            
                                      
                                            
                                         
                                        
                                         child: InkWell(
                                          
                                            hoverColor: Colors.orange,
                                            onTap: () async{
                                            
                                            
                                                    
                                           if(_keyForm.currentState!= null){
                                          //

                                           bool result = _keyForm.currentState!.validate();
                                        if(result){ 
                                         
                                         setState(()=> loading = true);

                                           }
                                        
                                         if(value1 == '5 Jours'){
                                           jourAfter = Jiffy.now().add(days:5).yMMMMd;
                                         }
                                         else if(value1 == '7 Jours'){
                                           jourAfter = Jiffy.now().add(days: 7).yMMMMd;
                                         }

                                         else if(value1 == '10 Jours'){
                                          
                                           jourAfter = Jiffy.now().add(days: 14).yMMMMd;
                                         }

                                         else{
                                           jourAfter = Jiffy.now().add().yMMMMd;

                                         }

                                         user.doc(documentData['phone']).update({

                                            'ramasseur' : value,
                                            'dateDebut' : jour,
                                            'dateRmassage' : jourAfter
                                         });

                                         Navigator.pushReplacementNamed(context,'/poubelle');
                                        ValideSnackBar(context, 'Profil completé avec succès');

                                      
                                           


                                           
                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Valider", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),


                                      
                             
            ])
            )
            )
            )
                 ),


                                         const SizedBox(height: 10,),

              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12,bottom: 12),
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
                      padding: const EdgeInsets.only(top:16.0,left: 5,right: 5),
                      child: Text("M."+" "+documentData['nom']+" "+documentData['prenom']+","+" "+"cette liste constitue les",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)
                      ,textAlign: TextAlign.justify, ),
                    ),
              
                      Padding(
                      padding: const  EdgeInsets.only(top:5.0,left: 5,right: 5),
                      child: Text("Noms des ramasseurs suivie de leurs quartiers, choisissez celui ou celle qui est à proximité de chez vous",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.justify
                      ,),
                    ),
                     
                    
                      
                    ],
                   ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
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

  DropdownMenuItem<String>builMenuItem(String item) => DropdownMenuItem
  (
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontSize: 17, ),
    ),
    );

  DropdownMenuItem<String>builMenuItem1(String item) => DropdownMenuItem
  (
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontSize: 17,),
    ),
    );