import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main(){
 runApp(Myapp());
}
class Myapp extends StatefulWidget{
 @override
 State<StatefulWidget> createState() {
  return _MyappState();
 }
}

class _MyappState extends State<Myapp>{
 var a=["press >","u did it","u did it again","omg u did it gain","aren\'t u bored","seriously","come on","why are u doing it?","just stop it","i said stop","tu chutiya he"];
 var b=0;
 int  _func(){
  setState(() {
   b--;
  });
 }
 int _function(){
  setState(() {
   if(b<a.length)
    b++;
  });
  return 1;
 }
 Widget build(BuildContext context){
  return MaterialApp(`
   home: Scaffold(
    appBar: AppBar(title: Center(child:Text("hi")),),
    body: (b < a.length && b>=0) ?Container(
     margin: EdgeInsets.symmetric(horizontal: 90,vertical: 20),
      child: Column(
       children: <Widget>[
        Question(a.elementAt(b)),
        Row(
          children: <Widget>[
            RaisedButton(child: Text("<"), onPressed: _func,color: Color.fromRGBO(120, 222, 222, 20.0),hoverColor: Colors.purple,),
            RaisedButton(child: Text(">"), onPressed: _function,color: Color.fromRGBO(233, 111, 11, 20.0),),
          ],
        ),
       ],
      ),
    ):Center(child: Text("apna kam karle",style: TextStyle(fontSize: 40))),
   ),
  );
 }
}