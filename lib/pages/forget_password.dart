// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../services/authentification.dart';
import 'global.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

   final _keyForm = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
   final AuthentificationService _auth = AuthentificationService();
  String email = '';
  //final AuthentificationService _auth = AuthentificationService();
  Future<bool> check() async{
      bool statut = false;
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.mobile){
          return true;
      }
      else if(connectivityResult == ConnectivityResult.wifi){
         return true;
      }
      return false;
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Mot de passe oublié", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF188C74),
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/connexion_ram'),
           icon: const Icon(Icons.arrow_back_ios_new))
        //automaticallyImplyLeading: false
      ),

      body:  SingleChildScrollView(
          child: Column(
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2,),
                    Container(
                  //margin: EdgeInsets.all(2),
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/forget.png'),
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
                    
                    child: Padding(padding: const EdgeInsets.only(top:200),
                      child: Column(
                        children:const  [
                          Text("Réinitialiser votre mot de passe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  ),
                ],
              ),
                // const SizedBox(height: 2,),
              
                       Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                         child: Container(
                              // decoration: const BoxDecoration(
                              //    color: Colors.white,
                              //    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                              // ),
                             
                         child: Form(
                                         key: _keyForm,
                                         child: Column(
                                           children: [
                                            const SizedBox(height: 15,),
                                             const Text("Vous avez oublié votre mot de passe ? Nous vous enverrons un email comportant des instructions pour le réinitialiser.",
                                             textAlign: TextAlign.justify, 
                                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                                             ,
                                             SizedBox(height: 20),
                                             TextFormField( 
                          decoration:const InputDecoration(
                            labelText: "Email",
                            hintText: "Entrez votre email",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(12),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFF188C74), width: 1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color:Color(0xFF188C74))
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1)
                            )
                          ),
                          validator: (val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer un email valide" : null,
                          onChanged: (val) => email = val,
                                             ),
                             
                                             SizedBox(height:20),
                                             
                                             
                             
                         Container(
                                 height: 48,
                                 width: double.maxFinite,
                                 decoration: BoxDecoration(
                                   color: Color(0xFF188C74),
                                   borderRadius: BorderRadius.circular(5),
                                 ),
                                 child: ElevatedButton(
                                     onPressed: ()async{
                             
                                   if(_keyForm.currentState!= null){
                                     bool resul = _keyForm.currentState!.validate();
                       
                        
                       
                       
                                     if(resul){   
                             
                                                      bool resul = _keyForm.currentState!.validate();

 


                                   if(resul){   
                                        var mail = email;
                                      
                                       
                                      bool connect = await check();
                                        if(connect){ 
                                            setState(() {
                                                      loading = true;});
                                             dynamic result =   _auth.SendEmailResetPassword(mail);
                                                                  
                                            if(result == null)
                                          {
                                           
                                            setState(() {
                                                      loading = false;
                                                      
                                                       erroSnackBar(context, 'Adresse email inconnue');
                                                  });
                                          }
                                          else{
                                         
                                                  Navigator.pushReplacementNamed(context, '/forget');
                                                // erroSnackBar(context, 'Produit ajouté avec succes');
                                           
                                                  ValideSnackBar(context,  'un email vient d\'être envoyé à cette adresse' +' ' +mail);
                                                     

                                          }        
                      
                                             } else{
                                           erroSnackBar(context, 'Verifier votre connexion internet');
                                         }

                                   }
                                     }
                                   }
                                                    
                                    },
                       
                                  
                                 child: const Text("Reinitialiser")
                             
                                 ),
                               ),
                              
                             
                         const SizedBox(height :20,),
                             
                          Text(
                            error,
                            style : const TextStyle(color: Colors.red, fontSize: 16),
                          ),
                             
                          const SizedBox(height: 15,),
                             
                                             Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Avez vous un compte ?",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 3,),
                            
                            GestureDetector(
                              onTap: ()=> Navigator.popAndPushNamed(context, '/prest'),
                              child: const Text(
                                "Créer Compte",
                                style: TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            )
                          ],
                                             )
                                           ],
                                         ),
                                       )
                                ),
                       ),
                           
                    
            ],
          
          ),
        ),

    );
  }
}