import 'package:flutter/material.dart';
import 'package:watsapp/locator.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/repository/user_repository.dart';
import 'package:watsapp/services/auth_base.dart';

enum ViewState{
  Idle,Busy
}

class UserModel with ChangeNotifier implements AuthBase{
  ViewState _state=ViewState.Idle;
  UserRepository _repository=locator<UserRepository>();
  User _user;
  String emailErrorMessage;
  String passwordErrorMessage;
  User get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel(){
    currentUser();
  }

  @override
  Future<User> currentUser() async{
    try{
      _state=ViewState.Busy;
     _user=await _repository.currentUser();
      return _user;
    }catch(e){
        debugPrint(e.toString());
        return null;
    }finally{
     state=ViewState.Idle;
    }
  }

  @override
  Future<User> signInAnonymously() async{
    try{
      _state=ViewState.Busy;
      _user= await _repository.signInAnonymously();
      return _user;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async{
    try{
      _state=ViewState.Busy;
       bool sonuc=await _repository.signOut();
       _user=null;
       return sonuc;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }finally{
     state= ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try{
      _state=ViewState.Busy;
      _user= await _repository.signInWithGoogle();
      return _user;
    }catch(e){
      debugPrint("viewdeki current user hatası :"+e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithFaceBook() async{

    try{
      _state=ViewState.Busy;
      _user= await _repository.signInWithFaceBook();
      return _user;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async{
    try{
      if(emailPasswordControl(email, password)){
        _state=ViewState.Busy;
        _user= await _repository.signInWithEmailAndPassword(email, password);
        return _user;
      }else
         return null;

    }catch(e){
      debugPrint(e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }

  @override
  Future<User> createUserEmailAndPassword(String email, String password) async{
    try{
      if(emailPasswordControl(email, password)){
        _state=ViewState.Busy;
        _user= await _repository.createUserEmailAndPassword(email, password);
        return _user;
      }else return null;

    }catch(e){
      debugPrint(e.toString());
      return null;
    }finally{
      state=ViewState.Idle;
    }
  }

  bool emailPasswordControl(String email,String password){
    var sonuc= true;
    if(password.length<6){
      passwordErrorMessage="Password must be at last 6 character";
      sonuc=false;
    }
    if(!email.contains('@')){
      emailErrorMessage="Email must contain @ character";
      sonuc=false;
    }
    return sonuc;
  }

}