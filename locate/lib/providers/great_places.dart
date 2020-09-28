import 'package:flutter/foundation.dart';
import 'package:locate/widgets/Location_input.dart';
import 'place.dart';
import 'dart:io';
import 'package:locate/helpers/db_helperr.dart';
class GreatPlaces with ChangeNotifier{
  List<Place> _items=[];
  List<Place> get items{
    return [..._items];
  }
  void addplace(String title,File imageFile,Locations place){
    final Place a=Place(
        id: DateTime.now().toString(),
        title: title,
        image: imageFile,
        location: place);
    _items.add(a);
    notifyListeners();
    DBHelper.insert('user_places', {
       'id': a.id,
       'title': a.title,
       'image': a.image.path,
       'loc_lat': a.location.latitude,
       'loc_log':a.location.longitude,
       'address':a.location.address,
    });
  }
  Future<void> fetchdata() async{
    final list=await DBHelper.getData('user_places');
    _items=list.map((e) => Place(
        id: e['id'],
        image:File(e['image']),
        title: e['title'],
        location: Locations(latitude: e['loc_lat'],longitude: e['loc_log'],address: e['address']),
    ),
    ).toList();
    notifyListeners();
    print("fetching");
  }
}