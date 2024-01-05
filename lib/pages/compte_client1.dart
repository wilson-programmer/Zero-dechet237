// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../models/argument_compte.dart';
import 'global.dart';
import 'loading.dart';



class CompteClient1 extends StatefulWidget {
  static String verify='';

  const CompteClient1({super.key});

  @override
  State<CompteClient1> createState() => _CompteClientState();
}

class _CompteClientState extends State<CompteClient1> {

  String phone = '';
  String quartier = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  final TextEditingController _quartierController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;





Future<void> checkCurrentUser() async {
  User? currentUser = _auth.currentUser;
  
}





  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentCompte;
    return loading ? Loading(): Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Inscription Client", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/compte'),
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
                                                     _register(args.name, args.prenom, args.ville);
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

  Future<void> _register(String nom,String prenom,String ville) async {
      
      String phoneNumber = '+237${_phoneNumberController.text}';
//+91$phoneNumber
    //  print('237'+' '+phone);



       try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              print("Le numéro de téléphone fourni n'est pas valide.");
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            CompteClient1.verify = verificationId;
            Navigator.pushReplacementNamed(context,'/verifyotp', arguments: ArgumentCompte1(name: nom, ville: ville,prenom: prenom,quartier: quartier,phone: phone));
            // String smsCode = '';
            // showDialog(
            //   context: context,
            //   barrierDismissible: false,
            //   builder: (context) => AlertDialog(
            //     title: Text('Saisir le code SMS'),
            //     content: TextField(
            //       onChanged: (value) => smsCode = value,
            //     ),
            //     actions: [
            //       TextButton(
            //         child: Text('Soumission'),
            //         onPressed: () async {
            //           PhoneAuthCredential credential =
            //               PhoneAuthProvider.credential(
            //                   verificationId: verificationId,
            //                   smsCode: smsCode.trim());
            //           await _auth.signInWithCredential(credential);

            //           // Enregistrer les informations d'utilisateur dans la base de données Firebase

            //            await FirebaseFirestore.instance.collection('users').doc(phone).set({
            //                                         'nom' : nom,
            //                                         'prenom' : prenom,
            //                                         'ville' : ville,
            //                                         'locality' : quartier,
            //                                         'phone' : phone,     
            //                                         'lastObservation' : '0'       
                                          
            //                                    });
                                    
            //               Navigator.pushReplacementNamed(context, '/poubelle');
            //               ValideSnackBar(context, 'Compte Creer avec succès');
            //         },
            //       ),
            //     ],
            //   ),
            //);
          },
          timeout: Duration(seconds: 20),
          codeAutoRetrievalTimeout: (String verificationId) {
            print('Timeout!');
          },
        );
      } catch (e) {
        print("Une vrai erreur");
      }
    

  }






  
}