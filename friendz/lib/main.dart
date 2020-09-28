import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friendz/screens/chat_screen.dart';
import 'package:friendz/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isVerified=false;
  @override
  Widget build(BuildContext context) {
    Future<bool> verified() async {
      var user= await FirebaseAuth.instance.currentUser();
      setState(() {
        if(user!=null && user.isEmailVerified) {
          print("ta da");
         isVerified=true;
        }
      });
    }
    return MaterialApp(
      title: 'friendz',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Colors.purpleAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      )),
      home:  isVerified?ChartScreen(): AuthScreen(),
      routes:
      {
        ChartScreen.routeName:(ctx)=>ChartScreen(),}
    );
  }
}

