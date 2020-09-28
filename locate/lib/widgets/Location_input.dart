import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locate/providers/place.dart';
import 'package:locate/screens/map_screen.dart';
import 'package:location/location.dart';
import 'package:locate/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  final Function selectPlace;
  LocationInput(this.selectPlace);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImage;
  Future<void> getCurrentLocation() async {
    try{final myLocation = await Location().getLocation();
    print("${myLocation.latitude}" + " " + "${myLocation.longitude}");
    final staticMapUrl = LocationHelper.generateLocationPreviewImage(
        myLocation.latitude, myLocation.longitude);
    setState(() {
      _previewImage = staticMapUrl;
    });
      widget.selectPlace(myLocation.latitude,myLocation.longitude);
  }
  catch(error){
      print(error);
  }
  }
  Future<void> _selectLocation() async{
    try{
      final selectedLocation=await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      builder: (ctx)=>MapScreen(
        selecting: true,),
    ),
    );
      if(selectedLocation==null){
        return;
      }
      print(selectedLocation.longitude);
      final staticMapUrl = LocationHelper.generateLocationPreviewImage(
          selectedLocation.latitude, selectedLocation.longitude);
      setState(() {
        _previewImage = staticMapUrl;
      });
      widget.selectPlace(selectedLocation.latitude,selectedLocation.longitude);
    }
    catch(error){
      print(error);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(border:Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
        height: 170,
        width:double.infinity,
        child:_previewImage==null?
        Text('No location choosen'):
        ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.network(_previewImage,fit: BoxFit.fill,width: double.infinity,)),
      ),
      Row(children: <Widget>[
        FlatButton.icon(onPressed: getCurrentLocation, icon: Icon(Icons.my_location,color: Colors.lightBlue,), label: Text('Current location',style: TextStyle(color: Colors.lightBlue),)),
        FlatButton.icon(onPressed: _selectLocation, icon: Icon(Icons.location_on,color:Colors.red), label: Text('Choose location',style: TextStyle(color: Colors.red),)),
      ],)
    ],);
  }
}
