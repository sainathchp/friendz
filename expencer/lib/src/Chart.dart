import 'package:expencer/src/ChartBar.dart';
import 'package:flutter/material.dart' ;
import 'package:expencer/transaction.dart';
import 'package:intl/intl.dart';
class  Chart extends StatelessWidget {
  final List<Transaction> trans;
  Chart(this.trans);
  var sum;
  List<Map<String ,Object>> get transactionvalues{
    return List.generate(7, (index) {
      final weekday=DateTime.now().subtract(Duration(days: index),);
      for(var i=0;i<trans.length;i=i+1){
        if(trans[i].date.day == weekday.day &&
            trans[i].date.month == weekday.month &&
            trans[i].date.year == weekday.year)
          sum =sum + trans[i].amount;
      }
      print(sum);
      print( DateFormat.E().format(weekday));
      return {
        "day": DateFormat.E().format(weekday),"amount":sum};
    });
  }
  double get maxSpending{
    return transactionvalues.fold(0.0,(sum,item){
      return (sum + item['amount']);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        shadowColor: Colors.amber,
        child: Row(
          children:
            transactionvalues.map((data){
            return ChartBar(data['day'],data['amount'],(data['amount'] as double)/maxSpending);
            }).toList(),
        ),
      ),
    );
  }
}
