// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/argument_compte.dart';



class CompteClient extends StatefulWidget {
  const CompteClient({super.key});

  @override
  State<CompteClient> createState() => _CompteClientState();
}

class _CompteClientState extends State<CompteClient> {


  String ville = '';
  String nom = '';
  String quartier = '';
  String prenom = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Inscription Client", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/connexion'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF188C74),))
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
                      image: AssetImage('assets/compte.png'),
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
                          Text("Créer votre compte cher client", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),


  
                     Container(
                            // decoration: const BoxDecoration(
                            //    color: Colors.white,
                            //    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                    child: SingleChildScrollView(
                                      child: Form(
                                                                 key: _keyForm,
                                                                 child: Column(
                                                                   children: [
                                      const SizedBox(height: 20,),

                                      const Text("Etape 1", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
const SizedBox(height: 10,),
                                       TextFormField(
                                        decoration:  const InputDecoration(
                                           labelText : "Nom",
                                           hintText: "Entrez votre mot nom",
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:  Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide : BorderSide(color:  Color(0xFF188C74), width: 1)
                                          ),
                                          focusedErrorBorder : OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder:  OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                         
                                        ),
                                       validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre nom" : null,
                                      onChanged : (val) => nom = val,
                                       ),
                                     const SizedBox(height: 20,),


                                      TextFormField(
                                        decoration:  const InputDecoration(
                                           labelText : "Prénom",
                                           hintText: "Entrez votre prénom",
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:  Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide : BorderSide(color:  Color(0xFF188C74), width: 1)
                                          ),
                                          focusedErrorBorder : OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder:  OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                         
                                        ),
                                       validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre prénom" : null,
                                      onChanged : (val) => prenom = val,
                                       ),
                                     const SizedBox(height: 20,),
                                             
                                       TextFormField(
                                        decoration:  const InputDecoration(
                                          labelText : "Ville",
                                          hintText: "Entrez votre ville residence",
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:  Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide : BorderSide(color:  Color(0xFF188C74), width: 1)
                                          ),
                                          focusedErrorBorder : OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder:  OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                         
                                        ),
                                        validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre ville residence" : null,
                                        
                                        onChanged: (val) => ville = val,
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
                                                bool result = _keyForm.currentState!.validate();
                                                 if(result){ 

                                                     Navigator.pushReplacementNamed(context,'/compte1', arguments: ArgumentCompte(name: nom, ville: ville,prenom: prenom));
                                                 }
                                    
                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Suivant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),
                                       const SizedBox(height: 20,),
                                      
                                        
                                              
                                       
                                                                   ],
                                                                 
                                                                ),
                                                         ),
                                    ),
                    
                              ),
                              ),
                           
          ]),
      ),
    );
  }
}