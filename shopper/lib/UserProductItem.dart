import 'package:flutter/material.dart';
class UserProductItem extends StatelessWidget {
  final String title,image;
  UserProductItem(this.title,this.image);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            title: Text(title),
            leading: CircleAvatar(backgroundImage: NetworkImage(image),),
            trailing: Container(
              width: 100,
              child: Row(children: <Widget>[
                IconButton(icon: Icon(Icons.edit,color: Colors.amber,), onPressed: () {}),
                IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: () {},),
              ],),
            ),
        ),
        Divider(color: Colors.black54,)
      ],
    );
  }
}
