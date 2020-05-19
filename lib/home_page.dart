import 'package:flutter/material.dart';
import 'package:watsapp/locator.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/services/auth_base.dart';
import 'package:watsapp/services/firebase_auth_service.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;
  AuthBase authService=locator<FirebaseAuthService>();
  final User user;
  HomePage({Key key,@required this.user,@required this.onSignOut}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          FlatButton(onPressed: signOut, child: Text("Sign Out",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Center(
        child: Text("Welcome "+user.userID)),
      );

  }

  Future<bool> signOut() async{
    var sonuc=await authService.signOut();
    onSignOut();
    return sonuc;
  }
}
