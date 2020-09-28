import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/OrderItem.dart';
import 'package:shopper/drawers.dart';
import 'providers/Orders.dart';
class OrdersScreen extends StatelessWidget {
  static const routeName="/orders";
  @override
  Widget build(BuildContext context) {
    final a=Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Orders"),),
      body: ListView.builder(itemBuilder: (ctx,i)=>OrderItems(a.orders[i]),itemCount: a.orders.length,),
    );
  }
}
