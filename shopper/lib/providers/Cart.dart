import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItems {
  final String image,id,title;
  final int quantity;
  final double price;
  CartItems({
    @required this.image,
    @required this.id,
    @required this.price,
    @required this.title,
    @required this.quantity
  }
  );
}
class Cart with ChangeNotifier {
  Map<String, CartItems> _items={};
  Map<String, CartItems> get items {
    return {..._items};
  }
  double get totalPrice{
    var total=0.0;
    _items.forEach((key, CartItems) {total+=CartItems.price*(CartItems.quantity);});
    return total;
  }

  int get itemCount{
    return _items==null ? 0:_items.length;
  }

  bool isInCart(String id){
    if (_items.containsKey(id)){
      return true;
    }
    return false;
  }

  void addIntoCart(String id,double price,String name,String image ){
    if (_items.containsKey(id)){
      _items.update(
          id, (existingCartItem) => CartItems(
          image: existingCartItem.image,
          id: existingCartItem.id,
          price: existingCartItem.price,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity+1)
      );
    }
    else{
      _items.putIfAbsent(
          id, ()=>CartItems(
          id: DateTime.now().toString(),
          price: price,
          title: name,
          quantity: 1,
          image: image,
      )
      );
  }
    notifyListeners();
  }

  void removeItem(String title){
    _items.remove(title);
    notifyListeners();
  }
  void removeAll(){
    _items.clear();
    notifyListeners();
  }
  void removeItemQuantity(String id){
    if(_items.containsKey(id)){
      if(_items[id].quantity>1){
        _items.update(id, (existingCartItem) => CartItems(
            image: existingCartItem.image,
            id: existingCartItem.id,
            price: existingCartItem.price,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity-1)
        );
      }
      else{
        _items.remove(id);
      }
    }
    notifyListeners();
  }
}