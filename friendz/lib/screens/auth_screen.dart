
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:friendz/screens/chat_screen.dart';
import 'package:friendz/widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String errorMessage;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool isLoading=false;
  @override
  void _submitAuthForm
      (String email,String password,String username,File dp,bool isLogin,BuildContext ctx)
         async {
    AuthResult authResult;
    FirebaseUser userDetails;
    var url;
              try {
                if (isLogin) {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    authResult = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    userDetails = await _auth.currentUser();
                    if (userDetails.isEmailVerified) {
                      print("verified");
                      setState(() {
                        isLoading = false;
                      });
                    Navigator.of(context).pushReplacementNamed(ChartScreen.routeName);
                  }
                    else {
                      Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Email not verified,please verify'),backgroundColor: Colors.red,));
                      setState(() {
                        isLoading=false;
                      });
                    }
                  }
                  catch (e) {
                    setState(() {
                      isLoading=true;
                    });
                    print(e.message);
                    switch (e.message) {
                      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                        errorMessage='User not found';
                        break;
                      case 'The password is invalid or the user does not have a password.':
                        errorMessage='Incorrect password';
                        break;
                      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                        errorMessage='Network error';
                        break;
                      case 'We have blocked all requests from this device due to unusual activity. Try again later. [ Too many unsuccessful login attempts. Please try again later. ]':
                        errorMessage='Too many attempts try again later';
                      break;
                      default:
                        print(e.message);
                    }
                    if(errorMessage!=null){
                      setState(() {
                        isLoading=false;
                      });
                      Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(errorMessage),backgroundColor: Colors.red,));
                    }
                  }
                }
                else {
                  try {
                    setState(() {
                      isLoading=true;
                    });
                    authResult = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    userDetails= authResult.user;
                    await userDetails.sendEmailVerification().then((value) {
                      setState(() {
                      isLoading=false;
                    });});
                    final ref = FirebaseStorage.instance.ref()
                        .child("user_images")
                        .child(authResult.user.uid+".jpg");
                    await ref.putFile(dp).onComplete;
                    url = await ref.getDownloadURL();
                    Firestore.instance.collection('users').document(
                        authResult.user.uid).setData(
                        {'username': username, 'email': email,"imageUrl":url,});
                    Scaffold.of(ctx).showSnackBar(
                        SnackBar(content: Text('Verification email sent'),));
                  }
                  catch (e) {
                    setState(() {
                      isLoading=false;
                    });
                    Scaffold.of(ctx).showSnackBar(SnackBar(
                      content: Text('could\'nt send verification email'),
                      backgroundColor: Colors.red,));
                  }
                }
              }
              on PlatformException catch (error) {
                setState(() {
                  isLoading=false;
                });
                var message = 'An error occurred please enter valid credentials';
                if (error.message != null) {
                  Scaffold.of(ctx).showSnackBar(SnackBar(
                    content: Text(message), backgroundColor: Colors.red,));
                }
              }
              catch (err) {
                print(err);
              }
         }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: double.infinity,
              width: double.infinity,
              child: Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/disp/496ecb14589707.562865d064f9e.png',fit: BoxFit.fill,)
          ),
          AuthForm(_submitAuthForm,isLoading),
        ],
      )
    );
  }
}

