import 'package:flutter/foundation.dart';
import 'Cart.dart';
class OrderItem {
  final String id;
  final double amount ;
  final List<CartItems> products;
  final DateTime dateTime;
  OrderItem({
    @required this.dateTime,
    @required this.id,
    @required this.products,
    @required this.amount}
    );
}
class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];
 List<OrderItem> get orders{
   return[..._orders];
 }

 void addOrder(List<CartItems> cartProducts,double total){
 if(total!=0){_orders.insert(0, OrderItem(
     id:DateTime.now().toString(),
      dateTime: DateTime.now(),
      amount: total,
      products: cartProducts
   )
 );
 }}
}