import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget{
  final String c;
  Question(this.c);
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
          c,
      style: TextStyle(fontSize: 28,color: Color.fromRGBO(200, 150, 111, 18.0),),
      ),
    );
  }
}

