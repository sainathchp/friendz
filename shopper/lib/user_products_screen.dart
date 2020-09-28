import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/UserProductItem.dart';
import 'package:shopper/edit_page.dart';
import 'package:shopper/providers/products.dart';
class UserProductsScreen extends StatelessWidget {
  static const routeName="/userproductsscreen";

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh(BuildContext context) async{
      await Provider.of<Products>(context).fetchProducts();
    }
    final a=Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your products"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed: () {
            showDialog(context: context ,builder:(ctx)=> EditProductScreen());
          },)
        ]
      ),
      body: RefreshIndicator(
        onRefresh: ()=>_refresh(context),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(itemBuilder: (ctx,i)=>UserProductItem(a.items[i].name,a.items[i].image),itemCount: a.items.length,)
        ),
      ),
    );
  }
}
