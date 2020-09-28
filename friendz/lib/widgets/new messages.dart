import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMessage="";
  var textController=TextEditingController();

  void _sendMessage() async {
    var user=await FirebaseAuth.instance.currentUser();
    var userDetails= await Firestore.instance.collection('users').document(user.uid).get();
    FocusScope.of(context).unfocus();
    textController.clear();
    Firestore.instance.collection('chat').add({
      'text':_enteredMessage.trim(),
      'time':Timestamp.now(),
      'userId': user.uid,
      'username': userDetails.data['username'],
    }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding:EdgeInsets.all(8),
      child: Row(
        children: [
           Expanded(
                child: TextField(
                  controller: textController,
                  autocorrect: true,
                  style: TextStyle(fontSize: 20),
                  cursorColor: Colors.white,
                  maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Your message here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white),),
                      suffixIcon:IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.amber,
                    onPressed: _enteredMessage.trim().isEmpty?null:_sendMessage,
                  ),focusColor:Colors.white,),onChanged: (value) {
                    setState(() {
                      _enteredMessage=value;
                    });
                },
                )
            ),
        ],
      ),
    );
  }
}
