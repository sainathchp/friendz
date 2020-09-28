import 'package:demo/ImageBlock.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listOfVideoUrl=[
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3i1v3cW3eJ9CoiuKPNTilFgMsjxldl5_5sA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0doijqlWX8gIm-biZ73izLzHk4ZmKcuxP-w&usqp=CAU",
      "https://cdn.home-designing.com/wp-content/uploads/2019/03/wooden-wall-decor.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7cd7lYdgm0XihjDkazqpaDxvdeCzFPIh2jg&usqp=CAU",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Column(
            children: [
              Container(
                height: ((MediaQuery.of(context).size.height)/2+20),
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.lerp(Radius.circular(10),Radius.circular(20), 4)),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQi12HF6fdir4BFRWQ79CsOfFtc97IUMMLWBA&usqp=CAU",fit: BoxFit.fill,height:(MediaQuery.of(context).size.height)/2+40 ,width: double.infinity,)),
                    Positioned(child: IconButton(icon: Icon(MdiIcons.bookmarkOutline,size: 30,color: Colors.white,)),top:20,right: 7,),
                    Positioned(child: IconButton(icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),top:20,left: 10,),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Container(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: SweepGradient(colors: [Color(0xffb30000),Color(0xff990000),],
                                ),
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 100.0, minHeight: 40.0),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.call,color: Colors.white,),
                                  Text(
                                    "Call",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 30,
                    right: 50,
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: SweepGradient(colors: [Color(0xffb30000),Color(0xff990000),],
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.humanMale,color: Colors.white,size: 24,),
                                Text(
                                  "Navigate",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  ],
                ),
      ),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                height: (MediaQuery.of(context).size.height) * 0.4,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("  ASNA HOME DECORATIONS\n  BAHRAIN CO. W.L.L",style: TextStyle(fontFamily: 'zantroke',fontSize: 13,letterSpacing: 1),),
                          Row(children: [
                            Icon(MdiIcons.facebook,color: Color(0xffb30000),size: 30,),
                            Icon(MdiIcons.instagram,color:  Color(0xffb30000),size: 30),
                            Icon(MdiIcons.email,color:  Color(0xffb30000),size: 30),
                          ],)
                        ],
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        title: Text("Home Furnishing | 52"),
                        subtitle: Text("Your inspiration for gorgeous decor design is found here"),
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        title: Text("SIMILAR SHOPS",style: TextStyle(fontFamily: 'zantroke',letterSpacing: 1),),
                        trailing: Text("View all",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(3),
                      scrollDirection: Axis.horizontal,
                        itemCount: listOfVideoUrl.length, //Notice this
                        itemBuilder: (ctx, index) => ImageItem(listOfVideoUrl[index]) ),
                  )
                    ],
                  ),
                ),
            ],
          ),
    );
  }
}
