import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shopper/Orders_screen.dart';
import 'package:shopper/providers/Orders.dart';
import 'providers/Cart.dart' show Cart;
import 'Cart_item.dart';
class CartScreen extends StatelessWidget {
  static const routeName="/cart";
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart"),),
      body:Column(children: <Widget>[
        Expanded(child: ListView.builder(itemCount: cart.items.length,itemBuilder: (ctx ,i) => CartItem(
            title: cart.items.keys.toList()[i],
            image: cart.items.values.toList()[i].image,
            price: cart.items.values.toList()[i].price,
            name: cart.items.values.toList()[i].title,
            quantity: cart.items.values.toList()[i].quantity))),
        SizedBox(height: 3,),
        Card(
         child:Padding(
           padding: EdgeInsets.all(5),
           child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Total " ,style:TextStyle(fontSize: 20)),
             Spacer(),
             Chip(label:Text("Rs.${cart.totalPrice}"),backgroundColor: Theme.of(context).accentColor,),
             FlatButton(onPressed: (){
               Provider.of<Orders>(context,listen: false).addOrder(cart.items.values.toList(), cart.totalPrice);
               cart.removeAll();
               Navigator.of(context).pushNamed(OrdersScreen.routeName);
             }, child: Text("Order Now",style: TextStyle(color: Theme.of(context).accentColor),))
           ],),
         )
        ),
      ],)
    );
  }
}
