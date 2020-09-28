import 'package:flutter/material.dart';
import 'package:locate/screens/add_pace_screen.dart';
import 'package:provider/provider.dart';
import "package:locate/providers/great_places.dart";
class PLacesListScreen extends StatefulWidget {
  @override
  _PLacesListScreenState createState() => _PLacesListScreenState();
}

class _PLacesListScreenState extends State<PLacesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Your places",style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_photo_alternate,color: Color.fromRGBO(52, 73, 94, 10)),
              onPressed: ()
              {
                Navigator.of(context).pushNamed(AddPlaceScreen.routename);
              }
              )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context,listen: false).fetchdata(),
        builder:(ctx,snapshot) => snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),):Consumer<GreatPlaces>(child: Center(child: Text("No places are listed",style: TextStyle(fontSize: 20),),),
          builder: (ctx,gp,ch)=> gp.items.length<=0?ch:ListView.builder(itemCount:gp.items.length,
              itemBuilder: (ctx,i)=>ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(gp.items[i].image),),
                  title: Text(gp.items[i].title),
                 subtitle: Text(gp.items[i].location.address),
                 onTap: () {},
              )
          ),
        ),
      ),
    );
  }
}
