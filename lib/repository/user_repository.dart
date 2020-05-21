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

}