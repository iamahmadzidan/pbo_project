import 'package:flutter/material.dart';

final _fireAuth = FirebaseAuth
class AuthProvider extends ChangeNotifier{
  final form = GlobalKey<FormFieldState>();

  var isilogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

  void submit() async{
    final _isvalid = form.currentState!.validate();
    if(!_isvalid){
      return;
    }

    form.currentState.save();
    try{
      if(isilogin){
        final UserCredential = 

      }else{

      }
    }catch(e){

    }

  }

  
}