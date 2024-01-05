// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/argument_compte.dart';



class Ramasseur extends StatefulWidget {
  const Ramasseur({super.key});

  @override
  State<Ramasseur> createState() => _RamasseurState();
}

class _RamasseurState extends State<Ramasseur> {


  String nom = '';
  String email = '';
  String password = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  String error = '';
  bool isHidden = true;
  @override

   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription Ramasseur", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor:Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/connexion_ram'),
           icon: const Icon(Icons.arrow_back_ios_new,color: Color(0xFF188C74),))
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
                      image: AssetImage('assets/sign1.png'),
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
                          Text("S'inscrit comme prestataire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),
                // const SizedBox(height: 2,),
              
                       Container(
                        
                                           child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SingleChildScrollView(
                                    child: Form(
                                     key : _keyForm,
                                     child: Column(
                                       children: [
                                       // const SizedBox(height: 25,),
                                        const Text("Etape 1", style: TextStyle(color: Colors.deepOrange, fontSize: 14)),
                                     TextFormField(
                                        decoration:  const InputDecoration(
                                           labelText : "Nom",
                                           hintText: "Entrez votre mot nom",
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide : BorderSide(color: Color(0xFF188C74), width: 1)
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
                                          labelText : "Email",
                                          hintText: "Entrez votre email",
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide : BorderSide(color: Color(0xFF188C74), width: 1)
                                          ),
                                          focusedErrorBorder : OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder:  OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                         
                                        ),
                                        validator: (val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer votre email valide" : null,
                                        
                                        onChanged: (val) => email = val,
                                       ),
                                       const SizedBox(height: 20,),
                                     TextFormField(
                                         obscureText: isHidden,
                                        decoration:  InputDecoration(
                                          suffix : InkWell(
                                              onTap: _togglePasswordView,
                                              child : const Icon(Icons.visibility),
                                          ),
                                          labelText : "Mot Passe",
                                          hintText: "Entrez votre mot passe",                      
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.all(12),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF188C74), width: 1),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide : BorderSide(color: Color(0xFF188C74), width: 1)
                                          ),
                                          focusedErrorBorder : const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1)
                                          ),                       
                                        ),
                                                      
                                        validator: (String ? val) => val!.length < 6 ? "Vous devez fournir un passe au moins a 6 caractere": null,
                                        onChanged: (val) => password = val,
                                       ),
                                     
                                                      
                                      const SizedBox(height: 30),
                                        
                                                    
                                         Container(
                                             height: 48,
                                             width: double.maxFinite,
                                             decoration: BoxDecoration(
                                               color: Color(0xFF188C74)
                                               ,
                                               borderRadius: BorderRadius.circular(5),
                                             ),
                                             child: InkWell(
                                                 onTap: () async{
                                                    
                                               if(_keyForm.currentState!= null){
                                                 bool result = _keyForm.currentState!.validate();
                                                 if(result){ 
                                                
                                                    print(nom);
                                                    print(email);
                                                    print(password);
                                                    Navigator.pushReplacementNamed(context,'/ram1', arguments: Argu(name: nom, email: email, passe:password));
                                               
                                                 }
                                                 
                                               }
                                            
                                             
                                             }, 
                                               child: const Padding(
                                               padding:  EdgeInsets.only(top:10.0),
                                               child:  Text("Suivant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                             )
                                                          
                                                    
                                             ),
                                           ),
                                                    
                                           const SizedBox(height: 15,),
                                           Text(error,
                                           style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                           const SizedBox(height: 15,),
                                                    
                                        
                                       ],
                                     ),
                                                                   ),
                                  )
                            
                                  ),
                              ),
                           
                    
            ],
          
          ),
        ),
    
    );
  }

   void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}