// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zero_dechet_237/pages/connexion_ramasseur.dart';

import 'global.dart';
import 'loading.dart';



class ConnexionClient extends StatefulWidget {
  const ConnexionClient({super.key});

  static String verify='';

  @override
  State<ConnexionClient> createState() => _ConnexionClientState();
}

class _ConnexionClientState extends State<ConnexionClient> {
  String phone = '';
    bool loading =false;
  final _keyForm = GlobalKey<FormState>();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Connexion Client", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF188C74),
       // elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/splash'),
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
                  height: 260,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/otp.png'),
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
                          Text("Veillé vous connectez cher client", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
                                      const SizedBox(height: 35,),

                                      
                                             
                                       IntlPhoneField(
                                       // initialValue: "+237",
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
                                      const SizedBox(height: 25,),
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
                                              verifyPhoneNumber(phone);
                                            }
                                          
                                           

                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Se connecter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),
                                      
                                        
                                          const SizedBox(height: 30,),
                                                    
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                       
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                              
                                         
                                           
                                              GestureDetector(
                                            
                                                onTap: () => Navigator.popAndPushNamed(context, '/condition'),
                                                child: const Text(
                                                  "Créer votre compte client",
                                                  style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                                                ),
                                              ),

                                              SizedBox(height: 20,),

                                              GestureDetector(

                                                onTap: (){
                                                    User? currentUser = _auth.currentUser;

                          if (currentUser != null) {
                          
                                Navigator.pushReplacementNamed(context,'/dashbord_ram');
                              ValideSnackBar(context, 'Vous êtez déjà Connecter');
                                              
                                      } else {

                                         //Navigator.pushReplacementNamed(context,'/connexion');
                                              Navigator.of(context).push(MaterialPageRoute(
                                              builder : (context) =>  const ConnexionRamasseur(),
                                            ));
                                            }
                                                },
                                            
                                               // onTap: () => Navigator.popAndPushNamed(context, '/connexion_ram'),
                                                child: const Text(
                                                  "Connexion en tant que ramasseur",
                                                  style: TextStyle(color:Color(0xFF188C74), fontSize: 18,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            
                                            
                                          ],
                                        )
                                                    
                                       
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


  Future<void> verifyPhoneNumber(String phoneNumber) async {
  await _auth.verifyPhoneNumber(
    phoneNumber:  phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Connexion automatique si la vérification est réussie
      await _auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) {

      ConnexionClient.verify = verificationId;
      Navigator.pushReplacementNamed(context,'/verify');
      // Sauvegarde l'ID de vérification pour l'utiliser plus tard
      // String smsCode = '';
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Enter SMS Code'),
      //       content: TextField(
      //         onChanged: (value) {
      //           smsCode = value;
      //         },
      //       ),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('Envoyer'),
      //           onPressed: () async {
      //             PhoneAuthCredential credential =
      //                 PhoneAuthProvider.credential(
      //               verificationId: verificationId,
      //               smsCode: smsCode,
      //             );
      //             await _auth.signInWithCredential(credential);
      //              Navigator.pushReplacementNamed(context,'/poubelle');
      //           },
      //         ),
      //       ],
      //     );
       // },
      //);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
}