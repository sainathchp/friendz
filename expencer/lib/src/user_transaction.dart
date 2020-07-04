import 'package:flutter/material.dart';
import 'NewTransaction.dart';
import 'TransactionList.dart';
import 'package:expencer/transaction.dart';
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
  void addNew(String title,double amount){
    final newtx=Transaction(title: title,amount: amount,date: DateTime.now(),id: (DateTime.now().toString()));
    setState(() {
      transactions.insert(0,newtx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(3),
            child: NewTransaction(addNew)),
        TransactionList(transactions)])
    );
  }
}
