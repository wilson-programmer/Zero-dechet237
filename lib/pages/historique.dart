// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_init_to_null, unnecessary_new, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zero_dechet_237/models/argument_compte.dart';

import 'dart:collection';
//import 'package:charts_flutter/flutter.dart' as charts;

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    List key = [];
    List value = [];
    List cles = [];
    List valeur = [];
    List total = [];
    int i;

  var formattedDate= new DateTime.now();
  //String dateHist = '${formattedDate.year}-0${formattedDate.month}-${formattedDate.day}';
 String dateHist = '2023-06-16';

    User? currentUser = _auth.currentUser;
     final size = MediaQuery.of(context).size;
     List<Data>  carl = [];
    final top ;
      List<dynamic> jsonList = [];
     final collection = FirebaseFirestore.instance.collection(currentUser!.phoneNumber!);
    

    return Stack(
        children: [
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: collection.doc(dateHist).get(),
            builder: (context, snapshot){
              

              if(snapshot.hasData){
                if(snapshot.data!.data()!=null){
                
               Map<String, dynamic> documentData = snapshot.data!.data() as Map<String, dynamic>;

              

                key.add(documentData.keys);
                value.add(documentData.values);

                key[0].forEach((element) { 
                    cles.add(element);
                });

                // value[0].forEach((value){
                //     valeur.add(value);
                // });

                  print(documentData.values);
                   print((documentData.values).runtimeType);

                    for (var value in (documentData.values)) {
                   valeur.add(value);
                }

                  for (var value in (documentData.keys)) {
                  cles.add(value);
                }

                valeur.sort();
                cles.sort();

                cles = cles.toSet().toList();
                valeur = valeur.toSet().toList();

                print(valeur);

                print(cles);
              
              List<Map<String,dynamic>> myList = [];

              for(int i=0; i<valeur.length; i++){
                myList.add({"niveau": valeur[i], "heure": cles[i]});
              }
            

              String jsonString = jsonEncode(myList);
               jsonList = jsonDecode(jsonString);

              for(var jsonMap in myList){
                   carl.add(Data(heure: jsonMap['heure'], niveau: jsonMap['niveau']));
              }

          //    carl.sort();

              print(myList);

             


              

                  
                 // print(key[0]);

             

               
               


    return Scaffold(
       appBar : AppBar(
        //iconTheme: IconThemeData(color: Color(0xFF188C74)),
        title: Text("Historique Vindage", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold),),
       // title: Image.asset('assets/'),
        backgroundColor : Colors.white,
        elevation: 0,
        centerTitle: true,
        leading : IconButton(
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/poubelle'),
           icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF188C74),))
       
      ),

      body: Container(
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
                    Row(
                children: [
                  Container(
                      width: size.width * 0.54,
                      height: 140,
                      margin: EdgeInsets.only(left: 8,right: 8,top: 8),
        
                       decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                          color: Color(0xFF188C74),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(100))
                                        
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Gere tes déchets et évite la pollution de l’environnement", style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                      SizedBox(height: 5,),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
                                      //  padding:  const EdgeInsets.all(12),
                                          // color: Colors.deepOrange,
                                           height: 40,
                                           width: 110,
                                         decoration: BoxDecoration(
                                         border: Border.all(width: 3,  color: Colors.white),
                                          color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        
                  ),
                                                          
                                          
                                           child: InkWell(
                                            
                                              hoverColor: Colors.orange,
                                              onTap: () async{
                                              
                            
                                           
                                           }, 
                                           child: const Padding(
                                             padding:  EdgeInsets.only(top:8.0),
                                             child:  Text("Savoir Plus", style: TextStyle(color: Color(0xFF188C74), fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center,),
                                           )
                                                      
                                           ),
                                         ),
      ),
                                      
                    ],
                  )
        
                  ),
                  Expanded(child: Image.asset('assets/dech2.png',width: 390,)),
                ],
              ),

              const SizedBox(height: 25,),

               Text("Votre Historique De Remplissage", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           
              const SizedBox(height: 20,),

              Text(dateHist),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    
                        IconButton(
                        onPressed: (){
                          final pickerDate = showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2024),
                          );

                          if(pickerDate != null){
                              setState(() {
                               // dateHist = pickerDate.toString();
                               pickerDate.then((dateTime) {
                                      dateHist= dateTime.toString();
                          });
                              });
                          }else{
                            print('rien');
                          }
                          print("Top");
                          print(dateHist);

                          
                        }, 
                        icon: Icon(Icons.date_range_outlined, color: Color(0xFF188C74),), 
                        
                        ),
                    
                ],
              ),


 
             
              SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<Data, String>>[
               LineSeries<Data, String>(
                   dataSource: carl
                   

      
                   ,
                  xValueMapper: (Data sales, _) => sales.heure,
                  yValueMapper: (Data sales, _) => sales.niveau,


                  
                )
              ]
          )
          
          
     
          ])
        )

        
      )
  );


   }else{

    Scaffold(
                body:  Center(child:  Text("Aucune historique ne correspond a cette date")),
              );
   
   }

            }


      return  Scaffold(
                body:  Center(child: CircularProgressIndicator(),
),
              );
                                      

            }
          )
        ],
      );




  }



}


