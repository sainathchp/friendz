import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/providers/products.dart';
import 'providers/product.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode=FocusNode();
  final _descriptionFocusNode=FocusNode();
  final _imageUrlController=TextEditingController();
  final _imageFocusNode=FocusNode();
  final _form=GlobalKey<FormState>();
  var _loading=false;
  var _editedProduct=Product(
    price: 0,
    image: "",
    description: "",
    name: "",
  );
  @override
  void dispose(){
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }
  void _updateImageUrl(){
    if(!_imageFocusNode.hasFocus){
      setState(() {
      });
    }
  }
  Future<void> _saveForm() async {
    final isValid=_form.currentState.validate();
    if(!isValid){
      return;
    }
    _editedProduct=Product(id :DateTime.now().toString(),image: _editedProduct.image, description: _editedProduct.description, name: _editedProduct.name, price: _editedProduct.price);
     _form.currentState.save();
     setState(() {
       _loading=true;
     });
     try{
       await Provider.of<Products>(context,listen: false)
           .addProduct(_editedProduct);
       setState(() {
         _loading=false;
       });
       Navigator.of(context).pop();
     }
     catch(onError) {
            showDialog(context: context,builder:
            (ctx)=>AlertDialog(
              title:Text("Error"),
              content: Text("An error occurred"),
              actions: <Widget>[FlatButton(child: Text("Okay"),onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },)],
            ));
        }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: _loading?Center(child: CircularProgressIndicator()):Container(
              padding: EdgeInsets.all(10),
              height: 420,
              width: 700,
              child: ListView(
                  children: <Widget>[
                    Text("Add/Edit product",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                    Form(
                      autovalidate: true,
                      key: _form,
                        child: Column(
                      children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_descriptionFocusNode);
                        },
                        onSaved: (value) {
                          _editedProduct=Product(id :null ,image: _editedProduct.image, description: _editedProduct.description, name: value, price: _editedProduct.price);
                        },
                        validator: (value) {
                          if(value.isEmpty){
                            return 'Please Enter Value';
                          }
                          else{
                            return null;
                          }
                          },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Description"),
                        textInputAction: TextInputAction.next,
                        focusNode: _descriptionFocusNode,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        onSaved:  (value) {
                          _editedProduct=Product(id :null ,image: _editedProduct.image, description: value, name: _editedProduct.name, price: _editedProduct.price);
                          },
                        validator: (value) {
                          if(value.isEmpty && _editedProduct.name==""){
                            return 'Please Enter Value';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Price"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.numberWithOptions(),
                        focusNode: _priceFocusNode,
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(_imageFocusNode);
                        },
                        onSaved:  (value) {
                          _editedProduct=Product(id :null ,image: _editedProduct.image, description: _editedProduct.description, name: _editedProduct.name, price: double.parse(value));
                        },
                        validator: (value) {
                          if(value.isEmpty){
                            return 'Please Enter Value';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      Row(children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(top:8,right: 8),
                          decoration: BoxDecoration(border: Border.all()),
                          child:_imageUrlController.text.isEmpty?Text("Enter a URL"):FittedBox(child: Image.network(_imageUrlController.text,fit: BoxFit.cover,),)
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "Image URL"),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageFocusNode,
                            onFieldSubmitted: (value){
                              _saveForm();
                              Navigator.of(context).pop();
                            },
                            onSaved:  (value) {
                              _editedProduct=Product(id :null,image: value, description: _editedProduct.description, name: _editedProduct.name, price: _editedProduct.price);
                            },
                            validator: (value) {
                              if(value.isEmpty){
                                return 'Please Enter Value';
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                        )
                      ],),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {_saveForm();},
                        child: Container(
                          width: 80,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.save,color: Colors.white,),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Save",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      )
                    ],
                        )
                    )
                  ],
                ),
              ),
      );
  }
}
