
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  final Function (File pickedImage) imagePickFn;
  ImageWidget(this.imagePickFn);
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File _image= new File('friendz/assets/images/default_dp.png');
  final picker = ImagePicker();
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera,imageQuality: 50);
    setState(() {
      _image = File(pickedFile.path);
      widget.imagePickFn(_image);
    });
  }
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 50);
    setState(() {
      _image = File(pickedFile.path);
      widget.imagePickFn(_image);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(radius: 40,backgroundImage: FileImage(_image),),
      Positioned(bottom: -15,right:-15,child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle),
          padding: EdgeInsets.all(0.000000005),
          constraints: BoxConstraints(
            minWidth: 16,
            minHeight: 16,
          ),
          child: IconButton(icon: Icon(Icons.camera_alt,size: 15,), onPressed:(){_showPicker(context);})))
    ],);
  }
}
