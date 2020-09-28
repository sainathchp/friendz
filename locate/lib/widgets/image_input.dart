import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  final Function selectImage;
  ImageInput(this.selectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async{
    final picker=ImagePicker();
    final image=await picker.getImage(source: ImageSource.camera,maxHeight: 600);
    if(image==null){
      return;
    }
    setState(() {
      _storedImage=File(image.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    print(appDir.path);
    var fileName = path.basename(File(image.path).path);
    var savedImage = await File(image.path).copy('${appDir.path}/$fileName');
    widget.selectImage(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    return Column
      (children: <Widget>[
      Container(
        width: double.infinity-20,
        height: 300,
        decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
        child:_storedImage==null?Column(
          children: <Widget>[
            SizedBox(height: 6,),
            Text("No Image available",textAlign: TextAlign.center,),
          ],
        ):Image.file(_storedImage,fit: BoxFit.cover,)
      ),
      SizedBox(height: 5,),
          FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera_alt,color: Colors.black,),
            label: Text("Take Picture",textAlign: TextAlign.center,),
            textColor:Colors.black,
      ),
    ],);
  }
}
