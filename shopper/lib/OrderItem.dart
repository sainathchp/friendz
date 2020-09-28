import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/Orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class OrderItems extends StatefulWidget {
  final OrderItem order;
  OrderItems(this.order);
  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded=false;
  @override
  Widget build(BuildContext context) {
     final a=Provider.of<Orders>(context);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
                title :Text("Rs.${widget.order.amount}"),
                subtitle: Text(DateFormat('dd/MM/yyyy, hh:mm').format(widget.order.dateTime)),
                trailing: IconButton(
                  icon: _expanded?Icon(Icons.expand_less):Icon(Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded=!_expanded;
                    });
                  },
                ),
              ),
          if(_expanded)
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              height: min(widget.order.products.length * 20.0+50,180),
              child: ListView(children:
                widget.order.products.map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("${e.title}"),
                        Text("x${e.quantity}"),
                        Text("id: ${e.id}")
                      ],
                    ),
                  ],
                )).toList()
              ),
            )
        ],
      )
      );
  }
}
