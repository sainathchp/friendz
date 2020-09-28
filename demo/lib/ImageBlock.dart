import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ImageItem extends StatelessWidget {
  final String url;
  ImageItem(this.url);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 120,
      child: Stack(children: [
        ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.network(url,fit: BoxFit.fill,height: 250,width: 100,),),
        Positioned(left:25,bottom:5,child: Text("004",style: TextStyle(color: Colors.grey),)),
      ],),
    );
  }
}
