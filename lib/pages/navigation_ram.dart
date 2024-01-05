import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/pages/contact.dart';
import 'package:zero_dechet_237/pages/splash.dart';

import 'client_ram.dart';
import 'contact_ram.dart';
import 'dashbord_ram.dart';


class NavigationRamasseur extends StatefulWidget {
  const NavigationRamasseur({super.key});

  @override
  State<NavigationRamasseur> createState() => _NavigationRamasseurState();
}

class _NavigationRamasseurState extends State<NavigationRamasseur> {
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
                                       
                                       const Text("Une plateforme qui facile la gestion des déchets ménagers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify,), 
                                        
                                      ],
                                      
                                    ) ,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    ),
                                
                        
                          builMenuItem(
                            text: 'Votre profil',
                            icon :  Icons.person,
                            onClicked: () => selectedItem(context,0),
                          ),
               
                           builMenuItem(
                            text: 'Liste des clients',
                            icon :  Icons.person_add_alt_1,
                            onClicked: () => selectedItem(context,1),
                          ),
          
                           builMenuItem(
                            text: 'Contatez nous',
                            icon :   Icons.call,
                            onClicked: () => selectedItem(context,2),
                          ),

                          const Divider(color: Colors.white70),
         
                          
                          builMenuItem(
                            text: 'Spash Page',
                            icon :  Icons.add_card_outlined,
                            onClicked: () => selectedItem(context,3),
                          ),

                          builMenuItem(
                            text: 'Deconnexion',
                            icon :  Icons.logout,
                            onClicked: () => selectedItem(context,4),
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
          builder : (context) =>  const DashbordRamasseur(),
        ));
        break;
      case 1 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const ClientRamasseur(),
        ));
        break;

      case 2 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) => const ContactRam(),
        ));
        break;
        case 3 :
        Navigator.of(context).push(MaterialPageRoute(
          builder : (context) =>  const SplashScreen(),
        ));
        break;

         case 4 :  await auth.signOut();
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