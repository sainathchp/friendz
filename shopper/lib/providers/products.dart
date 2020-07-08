import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier{
  List<Product> _items=[
    Product(
        id:"p1",
        name: "Jeans",
        description: "blue denim",
        price: 999.0,
        image: "https://5.imimg.com/data5/RI/FL/MY-13247115/kstorm-plain-dark-blue-jeans-500x500.jpg"
    ),
    Product(
        id:"p2",
        name: "White Shirt",
        description: "plain",
        price: 999.0,
        image: "https://4.imimg.com/data4/OE/EX/MY-10521202/formal-white-shirt-500x500.jpg"
    ),
    Product(
      id:"p3",
      name: "mobile",
      description: "smart phone",
      price:9999,
      image: "https://ksassets.timeincuk.net/wp/uploads/sites/54/2019/03/Xiaomi-Mi-9-front-angled-top-left-920x613.jpg",
      isFavourite: true
    )
  ];
  List<Product> get items{
    return [..._items];
  }
  void addProduct(){
    notifyListeners();
  }
}