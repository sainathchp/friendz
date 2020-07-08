import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/providers/products.dart';
class ProductDetailScreen extends StatelessWidget {
  static const routename="/product-detail";
  @override
  Widget build(BuildContext context) {
    final String id=ModalRoute.of(context).settings.arguments as String;
    final a=Provider.of<Products>(context).items.firstWhere((element) => element.id==id);
    return Scaffold(
      appBar: AppBar(title: Text(a.name),),
    );
  }
}
