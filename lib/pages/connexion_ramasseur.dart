// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zero_dechet_237/models/argument_compte.dart';

import '../services/authentification.dart';
import 'global.dart';
import 'loading.dart';



class ConnexionRamasseur extends StatefulWidget {
  const ConnexionRamasseur({super.key});

  @override
  State<ConnexionRamasseur> createState() => _ConnexionRamasseurState();
}

class _ConnexionRamasseurState extends State<ConnexionRamasseur> {



  String email = '';
  String password = '';
  final _keyForm = GlobalKey<FormState>();
  bool loading =false;
  String error = '';
  bool isHidden = true;
    final AuthentificationService _auth = AuthentificationService();
  @override

   void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


 // final AuthentificationService _auth = AuthentificationService();


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
    return loading ? Loading() :  Scaffold(
       appBar: AppBar(
        title: const Text("Connexion Ramasseur", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor:Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/connexion'),
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
                      image: AssetImage('assets/login.png'),
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
                          Text("Veillé vous connectez cher ramasseur", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
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
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                    child: SingleChildScrollView(
                                      child: Form(
                                                                 key: _keyForm,
                                                                 child: Column(
                                                                   children: [
                                      const SizedBox(height: 30,),
                                             
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
                                        validator: (String ?  val) =>val != null && !EmailValidator.validate(val) ? "Veuillez entrer votre email valide" : null,
                                        
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
                                                    
                                      const SizedBox(height: 20,),
                                                    
                                      Row(
                                        children: [
                                          const Spacer(),
                                          GestureDetector(
                                         onTap: () => Navigator.pushReplacementNamed(context, '/forget'),
                                         child: const Text("mot de passe oublier",style: TextStyle(decoration: TextDecoration.underline,) ,)),
                                        ],
                                      ),
                                      
                                       const  SizedBox(height: 20),
                                       // ignore: sized_box_for_whitespace
                                       Container(
                                        //padding:  const EdgeInsets.all(20),
                                        // color: Colors.deepOrange,
                                         height: 48,
                                         width: double.maxFinite,
                                            
                                         
                                         decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Color(0xFF188C74),
                                         ),
                                            
                                         
                                        
                                         child: InkWell(
                                          
                                            hoverColor: Colors.orange,
                                            onTap: () async{
                                            
                                            
                                                    
                                           if(_keyForm.currentState!= null){
                                          
                                                  bool result = _keyForm.currentState!.validate();
                                   if(result){ 
                                     bool connect = await check(); 
                                    // bool emailValid = RegExp(r"^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})+").hasMatch(email);
                                      
                                    if(connect){ 
                           
                                      
                                    setState(()=> loading = true);
                                    var mail = email;
                                    var pass = password;

                                    dynamic result = await _auth.signInWithEmailAndPassword(mail, pass);
                                    
                                    if(result == null)
                                    {
                                      setState(() {
                                        loading = false;
                                        erroSnackBar(context, 'Adresse email ou mot de passe incorrect');

                                      });
                                    }
                                    else{
                                          ValideSnackBar(context, 'Connexion réussit avec succès');
                                           Navigator.pushReplacementNamed(context, '/dashbord_ram',arguments: Argument(idUser: email.trim().toString()));
                                    }
                                     
                                    
                                      
                                    
                                  }else{
                                     erroSnackBar(context, 'Vérifier si vous êtes bien connecter à internet');
                                  }         
      
                                   }
                                           }
                                        
                                         
                                         }, 
                                         child: const Padding(
                                           padding:  EdgeInsets.only(top:10.0),
                                           child:  Text("Se connecter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                                         )
                                                    
                                         ),
                                       ),
                                      
                                         
                                         const SizedBox(height: 12,),
                                         Text(error,
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(color: Colors.red, fontSize: 16,),),
                                                    
                                          const SizedBox(height: 15,),
                                                    
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                       
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                              
                                         
                                           
                                              GestureDetector(
                                           
                                                onTap: () =>  Navigator.popAndPushNamed(context, '/condition1'),
                                                child: const Text(
                                                  "Creer votre Compte",
                                                  style: TextStyle(color: Colors.red, fontSize: 18),
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