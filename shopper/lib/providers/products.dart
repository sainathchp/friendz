import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
class Products with ChangeNotifier{
  List<Product> _items=[
    /*Product(
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
    )*/
  ];
  List<Product> get items{
    return [..._items];
  }
List<Product> get favouriteItems{
    print(_items.where((element) => element.isFavourite==true).toString());
  return _items.where((element) => element.isFavourite==true).toList();
}
  Future<void> fetchProducts() async {
    const url='https://shopper-781c8.firebaseio.com/products.json';
    try{
      final a=await http.get(url,);
      List<Product> loadedproducts=[];
      final extracted=json.decode(a.body) as Map <String,dynamic>;
      extracted.forEach((id,value) { loadedproducts.add(Product(
        id: id,
        name: value['name'],
        description: value['description'],
        price: value['price'],
        isFavourite: value['isFavourite'],
        image: value['image'],
        ));});
      _items=loadedproducts;
      notifyListeners();
    }
    catch(error){
      throw(error);
    }
  }
  Future<void> addProduct(Product p) async {
    const url='https://shopper-781c8.firebaseio.com/products.json';
    try {
      final value = await http.post(url, body: json.encode({
        'name': p.name,
        'price': p.price,
        'description': p.description,
        'image': p.image,
        'isFavourite': p.isFavourite}

      ));
      _items.add(Product(name: p.name,
          id: json.decode(value.body)['name'],
          price: p.price,
          description: p.description,
          image: p.image));
      notifyListeners();
    }
    catch(onError){
      throw onError;
    }
  }
}