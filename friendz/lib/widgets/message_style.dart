import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
class MessageBox extends StatelessWidget {
  final String message,userId;
  final bool isMe;
  final Key key;
  MessageBox(this.message,this.isMe,this.userId,{this.key});
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    Color _color = _randomColor.randomColor(
        colorSaturation: ColorSaturation.highSaturation
    );
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isMe?Color.fromRGBO(255,239 , 213, 10):Colors.blueGrey,
              borderRadius: isMe?BorderRadius.only(topLeft: Radius.circular(20) ,topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(0)):
              BorderRadius.only(topLeft: Radius.circular(0) ,topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
          ),),
        width: 140,
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            children: [
              FutureBuilder(
                future: Firestore.instance.collection('users').document(userId).get(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting)
                    return Text('Loading...');
                  return Text(snapshot.data['username'].toString(),style: TextStyle(color: _color,fontWeight: FontWeight.bold,),textAlign: TextAlign.end,);
                }
              ),
              Text(message,style: TextStyle(fontSize: 18,color: isMe?Colors.black:Colors.white),),
            ],
          )
        ),
      ],
    );
  }
}
