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
      debugPrint(e.toString());
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
  Future<User> signInWithEmailAndPassword(String email, String password) {

    return null;
  }

  @override
  Future<User> createUserEmailAndPassword(String emaiil, String password) {
    // TODO: implement createUserEmailAndPassword
    return null;
  }

}