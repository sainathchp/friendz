import 'package:flutter/material.dart';
import 'package:friendz/widgets/image_picker_widget.dart';
import 'dart:io';
class AuthForm extends StatefulWidget {
   final void Function(String email,String password,String username,File dp,bool isLogin,BuildContext ctx) submitFn;
  final bool isLoading;
   AuthForm(this.submitFn,this.isLoading);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _isVisiblePassword=false;
  final _formkey=GlobalKey<FormState>();
  bool _isLogin=true;
  String _userMail='',_useName='',_userPassword='';
  File _userImageFile;
  void _trySubmit(){
    final _isValid=_formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(_userImageFile==null && _isLogin==false){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("please pick an Image")));
      return ;
    }
    else if(_isValid){
      _formkey.currentState.save();
      widget.submitFn(
          _userMail.trim(),
          _userPassword.trim(),
          _useName.trim(),
          _userImageFile,
          _isLogin,
          context
      );
    }
  }
  void _PickedImage(File image){
    _userImageFile=image;
  }
  @override
  Widget build(BuildContext context) {
    return Center(child:
      Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(20),child:
         SingleChildScrollView(
      child:
            Padding(padding: EdgeInsets.all(16),child:
               Form(
                 key:_formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLogin?SizedBox():ImageWidget(_PickedImage),
                  _isLogin?Text("Log In",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.indigoAccent),):SizedBox(),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Please Enter Email';
                      }
                      if(!value.contains('@') || !value.contains('.')){
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userMail=value;
                    },
                  ),
                  _isLogin?SizedBox():TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                    keyboardType: TextInputType.name,
                    validator: (value){
                      if(value.isEmpty || value.length<5 || value.contains(' ')){
                        return 'Enter valid Username';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _useName=value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password',suffixIcon:  Padding(
                      padding:  EdgeInsets.only(top: 15.0),
                      child:  IconButton(icon:Icon( _isVisiblePassword ?Icons.visibility:Icons.visibility_off),onPressed: (){
                        setState(() {
                          _isVisiblePassword=!_isVisiblePassword;
                        });
                      },),
                    )),
                    obscureText: _isVisiblePassword?false:true,
                    validator: (value){
                      if(value.length<7){
                        return 'Please enter valid password';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _userPassword=value;
                    },
                  ),
                  SizedBox(height: 12,),
                  widget.isLoading?CircularProgressIndicator():RaisedButton(child:Text(_isLogin?'Login':'SignUp',style:TextStyle(color: Colors.white)),onPressed: _trySubmit,color: Color.fromRGBO(160, 0, 200 ,30),
                  ),
                  widget.isLoading?SizedBox():FlatButton(
                      highlightColor: Color.fromRGBO(255, 204, 255, 10) ,
                      onPressed:(){
                    setState(() {
                      _isLogin=!_isLogin;
                    });
                  }
                  , child: Text(_isLogin?"SignUp instead":"Login instead",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15),)
                  ),
                ],
              ),
                   ),
            ),
         ),
      ),
    );
  }
}
