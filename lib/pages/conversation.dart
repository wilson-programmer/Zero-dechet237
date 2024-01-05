
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_dechet_237/pages/theme.dart';

import '../models/argument_compte.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

  class _ConversationState extends State<Conversation> {
  TextEditingController commentController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

  
        
  
  @override
Widget build(BuildContext context) {
  
final size = MediaQuery.of(context).size;
User? currentUser = _auth.currentUser;
final args = ModalRoute.of(context)!.settings.arguments as ArgumentId;
var maintenant = new DateTime.now();
String formattedDate = '${maintenant.hour} h${maintenant.minute}';
print('Date actuelle : $formattedDate');
    return MaterialApp(
      theme : AppTheme.lightBase,
      darkTheme : AppTheme.lightBase,
      themeMode : ThemeMode.light,
      debugShowCheckedModeBanner:false,

      home: Scaffold(
          appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          
          centerTitle: true,
          title: const Text("Discussions", style: TextStyle(color: Color(0xFF188C74), fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('discussions')
                  .doc(args.send)
                  .collection('comments')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {

                   
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                       title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Expanded(
                             child: Container(
                                                     padding: EdgeInsets.only(top:8,left: 3,right: 3),
                              width: size.width,
                              decoration: BoxDecoration(
                                color:  'User' == snapshot.data!.docs[index].data()['username'].toString() ? Color(0xFF188C74) :  Color(0xFFFDD287),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   Text(
                                       // snapshot.data!.docs[index].data().toString(),
                                        snapshot.data!.docs[index].data()['comment'].toString(), style: TextStyle(color: 'User1' == snapshot.data!.docs[index].data()['username'].toString() ? Colors.black: Colors.white),),
                                     Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(snapshot.data!.docs[index].data()['jour'].toString(),style: TextStyle(color: 'User1' == snapshot.data!.docs[index].data()['username'].toString() ? Colors.black: Colors.white)),
                                     )
                                 ],
                               ),
                             ),
                           ),
                            //     const SizedBox(width: 3,),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 17.0),
                            //   child: Expanded(
                            //     child: Text(snapshot.data!.docs[index].data()['jour'].toString(),style: TextStyle(color: Colors.deepOrange),),
                                
                            //   ),
                            // )
                         ],
                       ),
                            // subtitle: Text(snapshot
                            // .data!.docs[index].data().toString()),
                        
                      );
                    },
                  );
               



                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Laisser un message',
                    ),
                   // maxLines: 2,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Color(0xFF188C74)
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send,color: Colors.white,),
                    onPressed: () {
                     if(currentUser!.phoneNumber == args.send){
                             FirebaseFirestore.instance
                          .collection('discussions')
                          .doc(args.send)
                          .collection('comments')
                          .add({
                        'comment': commentController.text,
                        'username': 'User',
                        'timestamp':  new DateTime.now(),
                        'jour' : formattedDate,
                        'idSend': args.send,
                        'idReceive' : args.receive
                      });
                     }else{
                           FirebaseFirestore.instance
                          .collection('discussions')
                          .doc(args.send)
                          .collection('comments')
                          .add({
                        'comment': commentController.text,
                        'username': 'User1',
                        'timestamp':  new DateTime.now(),
                        'jour' : formattedDate,
                        'idSend': args.send,
                        'idReceive' : args.receive
                      });
                     }
                 
                      commentController.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )

    );
  }
}