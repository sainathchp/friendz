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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border:Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(6),
              height: 300,
              width: double.infinity,
              child: Image.network(a.image,fit: BoxFit.cover),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(left: 10,top: 4,bottom: 4),
                  alignment: Alignment.centerLeft,
                  child: Column(children: <Widget>[
                  Text(a.name,style: TextStyle(fontSize: 20),),
                  Text("Rs.${a.price}",style: TextStyle(fontSize: 13,color: Theme.of(context).primaryColor),)
              ],),
                ),),
            )
          ],
        ),
      ),
    );
  }
}
