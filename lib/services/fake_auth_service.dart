import 'package:watsapp/models/user.dart';
import 'package:watsapp/services/auth_base.dart';

class FakeAuthService implements AuthBase{
  String _userID="123123123";
  @override
  Future<User> currentUser() async{

    return User(userID: _userID);
  }

  @override
  Future<User> signInAnonymously() async{

    return await Future.delayed(Duration(seconds: 2),()=>(User(userID:_userID )));
  }

  @override
  Future<bool> signOut() {

    return Future.value(true);
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }

  @override
  Future<User> signInWithFaceBook() {
    // TODO: implement signInWithFaceBook
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    return null;
  }

  @override
  Future<User> createUserEmailAndPassword(String emaiil, String password) {
    // TODO: implement createUserEmailAndPassword
    return null;
  }

}