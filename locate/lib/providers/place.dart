import 'package:flutter/foundation.dart';
import 'dart:io';
class Locations{
  final double latitude,longitude;
  final String address;
  const Locations({
    @required this.address,
    @required this.latitude,
    @required this.longitude
});
}
class Place{
  final String id,title;
  final Locations location;
  final File image;
  Place({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.location
  });
}