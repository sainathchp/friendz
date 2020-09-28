import 'package:locate/helpers/location_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locate/providers/place.dart';
import 'package:locate/widgets/Location_input.dart';
import 'package:locate/widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:locate/providers/great_places.dart';
class AddPlaceScreen extends StatefulWidget {
  static String routename="/addplace";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController=TextEditingController();
  File _pickedImage;
  Locations _pickedLocation;
  void _selectImage(File pickedimage){
    _pickedImage=pickedimage;
  }
  Future<void> _selectPlace  (double lat,double log) async {
    _pickedLocation=Locations(latitude: lat,longitude: log,address: await LocationHelper.generateLocationAddress(lat, log));
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage==null|| (_pickedLocation==null ) ){
      return;
    }
    Provider.of<GreatPlaces>(context,listen: true).addplace(_titleController.text, _pickedImage,_pickedLocation,);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    //final a=Provider.of<GreatPlaces>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add a new place"),backgroundColor: Colors.white,elevation: 0,),
      body:Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: <Widget>[
                       TextField(
                         decoration: InputDecoration(labelText: "Title"),
                         controller: _titleController,),
                      SizedBox(height: 6,),
                      ImageInput(_selectImage),
                      SizedBox(height: 6,),
                      LocationInput(_selectPlace),
                    ],
                  ),
                )
            )
            ),
            RaisedButton.icon(
                onPressed:_savePlace,
                icon: Icon(Icons.add_photo_alternate),
                label: Text("Add Place"),
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Color.fromRGBO(22, 160, 133, 10),
            )
          ],
        ),
      )
    );
  }
}
