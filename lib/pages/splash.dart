
// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zero_dechet_237/models/argument_compte.dart';
import 'package:zero_dechet_237/pages/connexion_client.dart';

import 'global.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

final Controller = LiquidController();
int currentPage = 0;
final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
        body : Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: Controller,
             onPageChangeCallback: OnPageChangeCallback,
            pages: [
              Container(
                padding: const EdgeInsets.all(5),
                color: const Color(0xFFF9FAFB),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    Image(image: const AssetImage('assets/deche1.png'), height: size.height * 0.45,),

                    Column(
                      children: 
                      const [
                         Text("Bienvenu sur zéro déchet 237", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold, fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Une application qui vous permet de réduire les déchets dans votre environnement et limiter la pollution.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                        
                      ],
                    
                    ),

                    const SizedBox(height: 65,),

                  Container(
                      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: size.width * 0.7,
                      height: 10,
                      color: Color(0xFFC1EFE5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF188C74) 
                  ),
                ),
                    Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB6E1D8)
                  ),
                ),
                   
                       Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color(0xFFB6E1D8)
                  ),
                ),
                   
                        ],
                      ),
                    ),
                
               
                  ]
                )
              ),

               Container(
                padding: const EdgeInsets.all(5),
                color: const Color(0xFFF9FAFB),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    Image(image: const AssetImage('assets/dech2.png'), height: size.height * 0.45,),
const SizedBox(height: 15,),
                    Column(
                      children: 
                      const [
                         Text("Travailler sur le zéro déchet 237", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold, fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Vous êtez étudiant ou alors vous souhaitez travailler en freelance et gagner de l’argent alors cette application est fait pour vous.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,)
                      ],
                    
                    ),

                     const SizedBox(height: 275,),

                 Container(
                      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: size.width * 0.7,
                      height: 10,
                      color: Color(0xFFC1EFE5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB6E1D8)
                  ),
                ),
                    Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF188C74) 
                  ),
                ),
                   
                       Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color(0xFFB6E1D8)
                  ),
                ),
                   
                        ],
                      ),
                    ),
                
             
                  ]
                )
              ),


                Container(
                padding: const EdgeInsets.all(5),
                color: const Color(0xFFF9FAFB),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    Image(image: const AssetImage('assets/cloud1.png'), height: size.height * 0.45,),
const SizedBox(height: 15,),
                    Column(
                      children: 
                      const [
                         Text("Bac à ordures connecté", style: TextStyle(fontFamily: AutofillHints.jobTitle, fontWeight: FontWeight.bold, fontSize: 20)),
                         SizedBox(height: 20,),
                         Text("Est un dispositif intelligent qui permet de suivre et de contrôler la collecte des déchets, il fonctionne en utilisant des capteurs.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,)
                      ],
                    
                    ),

                 
 const SizedBox(height: 265,),
                Container(
                      // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: size.width * 0.7,
                      height: 10,
                      color: Color(0xFFC1EFE5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB6E1D8)
                  ),
                ),
                    Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color(0xFFB6E1D8)
                  ),
                ),
                   
                       Container(

                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF188C74) 
                  ),
                ),
                   
                        ],
                      ),
                    ),
                
               
                  ]
                )
              )
            ],
             // slideIconWidget: const Icon(Icons.arrow_back_ios_new),
           // enableSideReveal: true,
          ),


            Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: (){
                  int nextPage = Controller.currentPage + 1;
                  Controller.animateToPage(page: nextPage);

                  if(nextPage == 3){

                    Navigator.of(context).push(MaterialPageRoute(
                                              builder : (context) =>  const ConnexionClient(),
                                            ));
                   
                     //User? currentUser = _auth.currentUser;

                    // if (currentUser != null) {
                    //             Navigator.pushReplacementNamed(context,'/poubelle' );
                    //           ValideSnackBar(context, 'Vous êtez déjà Connecter');
                                              
                    //                   } else {
                    //                           Navigator.of(context).push(MaterialPageRoute(
                    //                           builder : (context) =>  const ConnexionClient(),
                    //                         ));
                    //                         }
                 }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  side: const BorderSide(color:Color(0xFF188C74)),
                  onPrimary:  Colors.white
                ),

                child: Container(

                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF188C74)
                  ),
                  child:  const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),

            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: (){
                   User? currentUser = _auth.currentUser;

                          if (currentUser != null) {
                            print("Id user courant est : "+currentUser.uid);
                                Navigator.pushReplacementNamed(context,'/poubelle');
                              ValideSnackBar(context, 'Vous êtez déjà Connecter');
                                              
                                      } else {

                                         //Navigator.pushReplacementNamed(context,'/connexion');
                                              Navigator.of(context).push(MaterialPageRoute(
                                              builder : (context) =>  const ConnexionClient(),
                                            ));
                                            }
                 // Controller.jumpToPage(page: 2);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder : (context) =>  const ConnexionClient(),
                  // ));
                }, 
                child: const Text("Sauter", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),))
              ),

             

        ]
        )
    );

  }
    void OnPageChangeCallback(int Activepage){
     setState(() {
        currentPage = Activepage;
     });
  }
}











