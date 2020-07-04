import 'package:flutter/material.dart';
import 'package:expencer/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
 final List<Transaction> transactions;
 TransactionList(this.transactions);
 @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        margin: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(20.0),
                            decoration:BoxDecoration(shape: BoxShape.values[0],color: Color.fromRGBO(40, 180, 99, 45.0),border: Border.all(color:Color.fromRGBO(171, 178, 185, 45.0) )),
                            child :Text("Rs.${tx.amount.toString()}",style:TextStyle(color: Colors.white,),)
                        ),
                        Column(
                          children: <Widget>[
                            Text(tx.title,style:TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                            Text(DateFormat.MMMEd().format(tx.date))
                          ],)
                      ]
                  ),
                );
              }).toList()),
        )
    );
  }
}
