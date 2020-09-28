import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendz/widgets/message_style.dart';
class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: FirebaseAuth.instance.currentUser(),builder: (ctx,futureSnapshot){
      if(futureSnapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      return  StreamBuilder(stream: Firestore.instance.collection('chat').orderBy('time',descending: true).snapshots(),builder: (ctx,i) {
      if(i.connectionState==ConnectionState.waiting){
        return Center(child: RefreshProgressIndicator(),);
      }
        var user=futureSnapshot.data;
        return ListView.builder(reverse: true,itemCount:
         i.data.documents.length,itemBuilder: (ctx,index)=>MessageBox(i.data.documents[index]['text'],i.data.documents[index]['userId']==user.uid,i.data.documents[index]['userId'],key: ValueKey(i.data.documents[index].documentID),));});
    });
  }
}
