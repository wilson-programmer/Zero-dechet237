// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../models/argument_compte.dart';
import '../services/authentification.dart';
import 'global.dart';
import 'loading.dart';



class Ramasseur1 extends StatefulWidget {
  const Ramasseur1({super.key});

  @override
  State<Ramasseur1> createState() => _Ramasseur1State();
}

class _Ramasseur1State extends State<Ramasseur1> {

  String phone = '';
  String quartier = '';
  String ville = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  final AuthentificationService _auth = AuthentificationService();
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Argu;
    return loading ? Loading() : Scaffold(
        appBar: AppBar(
        title: const Text("Inscription Ramasseur", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor:Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/ram'),
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
const Text("Etape 2", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
const SizedBox(height: 10,),

                                       TextFormField(
                                        decoration:  const InputDecoration(
                                           labelText : "Quartier",
                                           hintText: "Entrez votre quartier residence",
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
                                        //controller: _quartierController,
                                       validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre quartier" : null,
                                      onChanged : (val) => quartier = val,
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
                                        //controller: _quartierController,
                                       validator: (String ? val) => val!.isEmpty ? "Veuillez entrer votre ville" : null,
                                      onChanged : (val) => ville = val,
                                       ),
                                     const SizedBox(height: 20,),
                                             
                                       IntlPhoneField(
                                      //  initialValue: '+237',
                                       //// controller: _phoneNumberController,
                                      
                                        decoration:  const InputDecoration(
                                          labelText : "Numéro Téléphone",
                                          hintText: "Entrez votre numéro téléphone",
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
                                         initialCountryCode: 'CM',
                                         onChanged: (value){
                                          phone = value.completeNumber;
                                         },
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
                                                   setState(()=> loading = true);

                                                  dynamic resu = await _auth.registerInWithEmailAndPassword(args.name,args.email.trim().toString(), args.passe, phone,ville,quartier); 
 
                                      if(resu == null)
                                    {
                                      setState(() {
                                        loading = false;
                                        erroSnackBar(context, 'Erreur creation de compte');

                                      });
                                    }
                                    else{
                                           ValideSnackBar(context, 'Compte Creer avec succès');
                                           Navigator.pushReplacementNamed(context, '/dashbord_ram', arguments: Argument(idUser: args.email.trim()));
                                    }
                                     
                                                    
                                                 }
                                    
                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Enregistrer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),
                                      const SizedBox(height: 20,)
                                        
                                              
                                       
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