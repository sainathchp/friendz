import 'package:flutter/material.dart';
import 'package:shopper/Orders_screen.dart';
import 'package:shopper/user_products_screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_frames),
            title: Text("Orders"),
            onTap: (){
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Your products"),
            onTap: (){
              Navigator.of(context).pushNamed(UserProductsScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
