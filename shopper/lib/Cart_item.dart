import 'package:flutter/material.dart';
import 'providers/Cart.dart';
import 'package:provider/provider.dart';
class CartItem extends StatelessWidget {
  final String name,image,title;
  final double price;
  final int quantity;
  CartItem({this.title,this.price,this.name,this.image,this.quantity});
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      confirmDismiss: (direction){
        return showDialog(context: context,builder: (ctx)=>
            AlertDialog(title: Text("Confirm to delete"),
              content: Text("Enter Confirm to delete or No to go back"),
              actions: <Widget>[
                FlatButton(onPressed: () {
                  Navigator.of(context).pop(true);
                }, child: Text("Confirm")),
                FlatButton(child: Text("No"),onPressed: () {
                  Navigator.of(context).pop(false);
                },)
              ],
            ));
      },
      onDismissed: (direction) {
         Provider.of<Cart>(context,listen: false).removeItem(title);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(left: 260,top: 20),
        child: Column(
          children: <Widget>[
            Icon(Icons.delete,color: Colors.white,size: 40,),
            Text("Delete",style: TextStyle(fontSize: 12,color: Colors.white),)
          ],
        ),
        color: Theme.of(context).errorColor,),
      key: ValueKey(name),
      child: Card(
        elevation: 10,
        child: Padding(padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Container(decoration:BoxDecoration(color: Colors.grey),child: Image.network(image,fit: BoxFit.fitHeight,width: 80,height: 80,)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,style: TextStyle(fontSize: 20),),
              SizedBox(width:4),
              Text("Rs. $price",style: TextStyle(color:
              Colors.grey),)
            ],
          ),
          subtitle: Text("Total: Rs.${price *quantity}",style: TextStyle(color: Theme.of(context).primaryColor),),
          trailing :Column(
            children: <Widget>[
              Text("Quantity"),
              Text('$quantity x'),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
