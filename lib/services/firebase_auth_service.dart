import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/services/auth_base.dart';

class FirebaseAuthService implements AuthBase{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  @override
  Future<User> currentUser() async{
    try{
      FirebaseUser user=await _firebaseAuth.currentUser();
      return userFromFirebase(user);
    }catch(e){
      debugPrint(e.toString());
      return null;
    }

  }

  User userFromFirebase(FirebaseUser firebaseUser){
    if(firebaseUser==null){
      return null;
    }
    return User(userID: firebaseUser.uid);
  }

  @override
  Future<User> signInAnonymously() async{
   try{
     AuthResult sonuc=await _firebaseAuth.signInAnonymously();
     return userFromFirebase(sonuc.user);
   }catch(e){
    debugPrint(e.toString());
   }
   return null;
  }

  @override
  Future<bool> signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }

  }

}