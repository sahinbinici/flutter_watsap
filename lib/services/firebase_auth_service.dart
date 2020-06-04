import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watsapp/models/user.dart';
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
    return User(userID: firebaseUser.uid,email: firebaseUser.email);
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
      final _googleSignIn=GoogleSignIn();
      final _facebookSignIn=FacebookLogin();
      await _facebookSignIn.logOut();
        await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }

  }

  @override
  Future<User> signInWithGoogle() async{
    GoogleSignIn _googleSignIn=GoogleSignIn();
    GoogleSignInAccount _googleUser=await _googleSignIn.signIn();
    if(_googleUser!=null){
      GoogleSignInAuthentication _googleAuth=await _googleUser.authentication;
      if(_googleAuth.idToken!=null && _googleAuth.accessToken!=null){
        AuthResult sonuc=await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken)
        );
        FirebaseUser _user=sonuc.user;
        return userFromFirebase(_user);
      }else{
        return null;
      }
    }
    return null;
  }

  @override
  Future<User> signInWithFaceBook() async {
    final facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin
        .logInWithReadPermissions(['public_profile', 'email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        if (result.accessToken != null) {
          AuthResult firebaseResult = await _firebaseAuth.signInWithCredential(
              FacebookAuthProvider.getCredential(
                  accessToken: result.accessToken.token));
          FirebaseUser _user = firebaseResult.user;
          return userFromFirebase(_user);
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        debugPrint("Kullanıcı girişi iptal etti");
        break;
      case FacebookLoginStatus.error:
        debugPrint("Hata çıktı" + result.errorMessage);
        break;
    }
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password)async{

    try{
      AuthResult sonuc=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userFromFirebase(sonuc.user);
    }catch(e){
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<User> createUserEmailAndPassword(String email, String password) async{
    try{
      AuthResult sonuc=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userFromFirebase(sonuc.user);
    }catch(e){
      debugPrint(e.toString());
    }
    return null;
  }

}