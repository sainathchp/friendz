import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double samount;
  final double spentTotal;
  ChartBar(this.label,this.samount,this.spentTotal);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Rs.${samount.toStringAsFixed(0)}'),
      SizedBox(
        height: 4,
      ),
      Container(
        height:60,
        width: 10,
        child:Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1.0)),
            color :Colors.amber,

          )
        ],)
      ),
      FractionallySizedBox(
        heightFactor: spentTotal,
        child:Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(label),
    ],);
  }
}
