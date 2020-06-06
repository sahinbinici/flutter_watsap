import 'package:watsapp/locator.dart';
import 'package:watsapp/models/user.dart';
import 'package:watsapp/services/auth_base.dart';
import 'package:watsapp/services/fake_auth_service.dart';
import 'package:watsapp/services/firebase_auth_service.dart';
import 'package:watsapp/services/firestoreDb_service.dart';

enum AppMode{
  DEBUG,RELEASE
}
class UserRepository implements AuthBase{
  FirebaseAuthService _firebaseAuthService=locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService=locator<FakeAuthService>();
  FirestoreDBService _firestoreService=locator<FirestoreDBService>();
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
      User user=await _firebaseAuthService.signInWithGoogle();

      if(user!=null){
        await _firestoreService.saveUser(user);
        return user;
      }else return null;

    }
  }

  @override
  Future<User> signInWithFaceBook() async{

    if(_appMode==AppMode.DEBUG){
      return await _fakeAuthService.signInWithFaceBook();
    }else{
      User user=await _firebaseAuthService.signInWithFaceBook();
      bool _sonuc=await _firestoreService.saveUser(user);
      if(_sonuc){
        return user;
      }else return null;
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
      User user=await _firebaseAuthService.createUserEmailAndPassword(email, password);
      bool _sonuc=await _firestoreService.saveUser(user);
      if(_sonuc){
        return user;
      }else return null;

    }
  }

}