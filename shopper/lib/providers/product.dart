import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id,name,description,image;
  final double price;
  bool isFavourite;
  Product({
    @required this.id,
    @required this.image,
    @required this.description,
    @required this.name,
    @required this.price,
    this.isFavourite=false
       }
      );
  void toggleFavourites(){
    isFavourite=!isFavourite;
    notifyListeners();
  }
}