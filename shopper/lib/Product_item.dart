import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/Productdetailscreen.dart';
import 'package:shopper/providers/Cart.dart';
import 'providers/product.dart';
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final a=Provider.of<Product>(context);
    final cart =Provider.of<Cart>(context,listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
        child: GridTile(
          child: GestureDetector(
              onTap:(){
            Navigator.of(context).pushNamed(ProductDetailScreen.routename,arguments: a.id);
          },
              child: Image.network(a.image,fit: BoxFit.cover,)),
          footer: GridTileBar(
            title: Text(a.name),
            backgroundColor: Colors.black12,
            leading: IconButton(
              icon:Icon(a.isFavourite?Icons.favorite:Icons.favorite_border,
              color: Theme.of(context).accentColor,),
              onPressed: () {a.toggleFavourites();},
            ),
            trailing: IconButton(icon: Icon(Icons.shopping_cart,
                color: Theme.of(context).accentColor),
                onPressed: () {
                     cart.addIntoCart(a.id, a.price, a.name,a.image);
                     Scaffold.of(context).hideCurrentSnackBar();
                     Scaffold.of(context).showSnackBar(
                         SnackBar(
                             duration: Duration(seconds: 3),
                             content: Text("Added item into cart"),
                             action: SnackBarAction(label: 'UNDO',onPressed: () {
                               cart.removeItemQuantity(a.id);
                         },),
                         )
                     );
                }
                ),
          ),
        ),
      );
  }
}
