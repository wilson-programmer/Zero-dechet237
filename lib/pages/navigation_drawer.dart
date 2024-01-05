
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/pages/complet_profil.dart';
import 'package:zero_dechet_237/pages/historique.dart';
import 'package:zero_dechet_237/pages/poubelle.dart';
import 'package:zero_dechet_237/pages/profil_ramasseur.dart';
import 'package:zero_dechet_237/pages/splash.dart';

import 'contact.dart';



class NavigationDrawers extends StatefulWidget {
  const NavigationDrawers({super.key});

  @override
  State<NavigationDrawers> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawers> {


  
  
  @override
  Widget build(BuildContext context) {
 
    return Theme(
                 data : ThemeData.dark(),
                child: Drawer(
                  child: Material(
                   
                   color: const Color(0xFFFDD287),
                 //  color: Colors.deepOrange,
                 
                      child: ListView(
                        children: [
                               
                             DrawerHeader(
                                    // ignore: sort_child_properties_last
                                    child: Column(
                                      children: [
                                      //  const SizedBox(height: 10,),
                                         Expanded(child: Image.asset("assets/logo.png", width: 145,)),
                                        // CircleAvatar(
                                        //   backgroundColor: Colors.white,
                                        //   //radius: 30,
                                        //   child: 
                                        // ),
                                      //  const SizedBox(height: 10,),
                                       const Text("Une plateforme qui facile la gestion des déchets ménagers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify,), 
                                        
                                      ],
                                      
                                    ) ,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    ),
                                
                        
                          builMenuItem(
                            text: 'Ma Poubelle',
                            icon :  Icons.restore_from_trash_rounded,
                            onClicked: () => selectedItem(context,0),
                          ),
               
                           builMenuItem(
                            text: 'Compléter Son Profil',
                            icon :  Icons.person_add_alt_1,
                            onClicked: () => selectedItem(context,1),
                          ),
          
                           builMenuItem(
                            text: 'Historisque Poubelle',
                            icon :   Icons.trending_up_sharp,
                            onClicked: () => selectedItem(context,2),
                          ),

                  
                           builMenuItem(
                            text: 'Profil Du Ramasseur',
                            icon :  Icons.person,
                            onClicked: () => selectedItem(context,3),
                          ),
                              builMenuItem(
                            text: 'Contactez Nous',
                            icon :  Icons.call,
                            onClicked: () => selectedItem(context,4),
                          ),
                        
                  
                          const Divider(color: Colors.white70),
         
                          
                          builMenuItem(
                            text: 'Spash Page',
                            icon :  Icons.add_card_outlined,
                            onClicked: () => selectedItem(context,5),
                          ),

                          builMenuItem(
                            text: 'Deconnexion',
                            icon :  Icons.logout,
                            onClicked: () => selectedItem(context,6),
                          ),
                        // ignore: avoid_print
                       // print(appuser.uid);
                        ]
                      )
                  )
                  ),
      
    );
  }
  }
  Widget builMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    const color = Colors.black;
    const hoverColor = Colors.black;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,

    );

  }

  

  Future<void> selectedItem(BuildContext context, int index)async {
     final FirebaseAuth auth = FirebaseAuth.instance;
    Navigator.of(context).pop();
    switch(index)
    {
      case 0 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) =>  const Poubelle(),
        ));
        break;
      case 1 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const CompleteProfil(),
        ));
        break;

      case 2 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const Historique(),
        ));
        break;
        case 3 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) =>  const ProfilRamasseur(),
        ));
        break;
        case 4 : Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const Contact(),
        ));
        break;

         case 5 : Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const SplashScreen(),
        ));
        break;

         case 6 :  await auth.signOut();
         Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const SplashScreen(),
        ));
        break;



    }

    

  

  Widget builMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    const color = Colors.black;
    const hoverColor = Colors.black;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,

    );

  }


  }


 