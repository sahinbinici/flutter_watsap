import 'package:watsapp/models/user_model.dart';
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

}