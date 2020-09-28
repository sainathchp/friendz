import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendz/widgets/messese.dart';
import 'package:friendz/widgets/new%20messages.dart';

class ChartScreen extends StatefulWidget {
  static const routeName='/chat_screen';

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("welcome"),actions: [
        DropdownButton(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          items: [DropdownMenuItem(
            child: Container(
              child: Row(children: [
                Icon(Icons.exit_to_app),
                Text('  Logout'),
              ],),
            ),
            value: 'logout',
          )],
        onChanged:  (itemIdentifier){
            if(itemIdentifier=='logout'){
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed("/");
            }
        },
        )
      ],
      ),
      body: Stack(
         children: [
           Container(
             height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
               child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRKUFBXUbOWVr4PCb5AuJnshX6ZifuEcVv-xw&usqp=CAU',fit: BoxFit.fill,)),
           Container(
               child:Column(
                 children: [
                   Expanded(child: Messages()),
                   NewMessage(),
                 ],
               )),
         ],
      ),

    );
  }
}