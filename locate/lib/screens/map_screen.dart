import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locate/providers/place.dart';
class MapScreen extends StatefulWidget {
  static const routename="/mapPage";
  final Locations initialLocation;
  final bool selecting;
  MapScreen({this.initialLocation=const Locations( address: 'dummy', longitude: 78.9629, latitude: 20.5937,),this.selecting=false});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _latLng;
  void _selectL(LatLng position){
    setState(() {
      _latLng=position;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(
          zoom: 10,
          target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude)
      ),
      onTap: widget.selecting?_selectL:null,
      onLongPress: widget.selecting?(a) {
        _latLng==null? print("null"):Navigator.of(context).pop(_latLng);
      }:null,
      markers: _latLng==null?null:{
        Marker(
        markerId: MarkerId('m1'),
          position: _latLng,
      )
      },),
    );
  }
}
