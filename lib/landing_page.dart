import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/home_page.dart';
import 'package:watsapp/signin_page.dart';
import 'package:watsapp/view_models/user_model.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userModel =Provider.of<UserModel>(context);

    if(userModel.state==ViewState.Idle){
        if(userModel.user==null){
          return SignInPage();
        }else{
          return HomePage(user: userModel.user);
        }
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

  }

}
