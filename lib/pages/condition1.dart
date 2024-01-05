// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zero_dechet_237/pages/compte_client.dart';
import 'package:zero_dechet_237/pages/global.dart';
import 'package:zero_dechet_237/pages/ramasseur.dart';



class ConditionGenerale1 extends StatefulWidget {
  const ConditionGenerale1({super.key});

  @override
  State<ConditionGenerale1> createState() => _ConditionGeneraleState();
}

class _ConditionGeneraleState extends State<ConditionGenerale1> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        title: const Text("Condition Générale", style: TextStyle(color: Color(0xFF188C74)),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/connexion_ram'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF188C74),))
        //automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
        
          child: Column(
            children:  [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right:130),
                child: Text("À propos de nos Services",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("L'application zéro déchet 237 est une application gratuite accessible via à travers les magasins Play store et App Store dans le but de vous permettre de gérer vos déchets de manière intelligente en consultant en temps réel les niveaux de remplissage de votre poubelle et l'historique ceci grace à une équipe de ramassage hebdomadaire.", textAlign: TextAlign.justify,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right:160),
                child: Text("Collecte des données",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("Pour la création du compte de l’Utilisateur, la collecte des informations au moment de l’inscription sur l'application est nécessaire et obligatoire. Dans l'optique d'ameliorer et de faciliter votre experience utilisateur, la collecte et le traitement d’informations personnelles s’effectuent dans le respect de la vie privée et est a titre non publique.",textAlign: TextAlign.justify),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text("Sécurité et intégrité",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Text("Nous nous efforçons de garantir la sécurité et l'intégrité de nos Services. Cela comprend le traitement approprié des personnes faisant preuve d'un comportement abusif et des activités en violation de nos Conditions. Nous nous efforçons d'interdire toute utilisation de nos Services à mauvais escient, notamment tout comportement nuisible envers autrui et toute violation de nos Conditions et politiques, et nous abordons les situations dans lesquelles nous pourrions être en mesure de soutenir ou protéger notre communauté.",textAlign: TextAlign.justify),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right:230),
                child: Text("Frais et taxes,",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Text("Vous êtes responsable de l’ensemble des frais d’abonnement au service de données de votre opérateur, des frais Internet et des autres taxes et frais associés à votre utilisation de nos Services.",textAlign: TextAlign.justify),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right:100),
                child: Text("Nos Conditions et politiques",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              Text(" Vous devez utiliser nos Services conformément à nos Conditions et politiques. Si vous enfreignez nos Conditions ou politiques, nous pouvons prendre des mesures concernant votre compte, y compris le désactiver ou le suspendre",textAlign: TextAlign.justify),
            
               SizedBox(height: 20,),

               Row(
                
                 children: [
                   Checkbox(
                              value: this.value, onChanged: (bool? value) { setState(() {
                                this.value = value!;
                              }); },
                              
                            ),
                            Text("Lu est approuvé"),
                 ],
               ), 

                SizedBox(height: 20,),

                Container(
                  width: double.infinity,

                  color: Color(0xFF188C74),
                  child: TextButton(
                    onPressed: (){
                      if(value){
                         Navigator.of(context).push(MaterialPageRoute(
                                              builder : (context) =>  const Ramasseur(),
                                            ));
                      }
                      else{
                        erroSnackBar(context, "Veuillez accepter les conditions générales");
                      }
                      
                    },
                    child: Text("Continuer", style: TextStyle(color: Colors.white),)
                    ),
                )
            
            ],
          ),
        ),
      ),
    );
  }
}