import 'package:watsapp/locator.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/services/auth_base.dart';
import 'package:watsapp/services/fake_auth_service.dart';
import 'package:watsapp/services/firebase_auth_service.dart';

enum AppMode{
  DEBUG,RELEASE
}
class UserRepository implements AuthBase{
  FirebaseAuthService _firebaseAuthService=locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService=locator<FakeAuthService>();
  AppMode _appMode=AppMode.RELEASE;
  @override
  Future<User> currentUser() async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.currentUser();
    }else{
      return await _firebaseAuthService.currentUser();
    }

  }

  @override
  Future<User> signInAnonymously() async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signInAnonymously();
    }else{
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signInWithGoogle();
    }else{
      return await _firebaseAuthService.signInWithGoogle();
    }
  }

  @override
  Future<User> signInWithFaceBook() async{

    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signInWithFaceBook();
    }else{
      return await _firebaseAuthService.signInWithFaceBook();
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signInWithEmailAndPassword(email, password);
    }else{
      return await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    }
  }

  @override
  Future<User> createUserEmailAndPassword(String email, String password) async{
    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.createUserEmailAndPassword(email, password);
    }else{
      return await _firebaseAuthService.createUserEmailAndPassword(email, password);
    }
  }

}