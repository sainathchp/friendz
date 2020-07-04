import 'package:expencer/src/NewTransaction.dart';
import 'package:expencer/src/user_transaction.dart';
import 'package:expencer/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions=[
    Transaction(
        id:"A1B2",
        title:"title",
        amount:20.0,
        date :DateTime.now()
    ),
    Transaction(
        id:"A1B3",
        title:"title",
        amount:30.0,
        date :DateTime.now()
    ),
    Transaction(
        id:"A1B4",
        title:"title",
        amount:40.0,
        date :DateTime.now()
    ),
  ];
  void startAdd(BuildContext ctx){
    showBottomSheet(context: ctx, builder: (_) {
      return UserTransaction();
    });
  }
  List<Transaction> get _recent{
    return transactions.where((tx) => (tx.date.isAfter(DateTime.now().subtract(Duration(days:  7),),))).toList();
  }
  @override
  Widget build(BuildContext context){
  return MaterialApp(
    title: "homepage",
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.amber,
      fontFamily: 'caviar',
    ),
    home: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => startAdd(context)),
        ],
        title: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          child: Column(
              children: <Widget>[
              UserTransaction(),
                ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add),onPressed: () {}),
      )
      );
  }
}