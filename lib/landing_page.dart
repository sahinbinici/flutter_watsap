import 'package:flutter/material.dart';
import 'package:watsapp/home_page.dart';
import 'package:watsapp/locator.dart';
import 'package:watsapp/services/auth_base.dart';
import 'package:watsapp/services/firebase_auth_service.dart';
import 'package:watsapp/signin_page.dart';

import 'models/user_model.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthBase authService=locator<FirebaseAuthService>();
  User _user;
  @override
  void initState(){
    super.initState();
  checkUser();

  }
  @override
  Widget build(BuildContext context) {
    if(_user==null){
      return SignInPage(

        onSignIn: (user){
          updateUser(user);
        },
      );
    }else{
      return HomePage(
        user: _user,
      onSignOut: (){
          updateUser(null);
      },
      );
    }
  }
  Future<void> checkUser()async{
    _user=await authService.currentUser();
  }
  void updateUser(User user){
    setState(() {
      _user=user;
    });
  }
}
