import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/app/sign_in/email_pass_subscribe.dart';
import 'package:watsapp/common_widgets/social_login_buttons.dart';
import 'package:watsapp/view_models/user_model.dart';

class SignInPage extends StatelessWidget {

  void _guestLogin(BuildContext context) async{
    final userModel =Provider.of<UserModel>(context);
    var _user=await userModel.signInAnonymously();
    debugPrint("UserID "+_user.userID);
  }

  void loginWithGoogle(BuildContext context) async{
    final userModel =Provider.of<UserModel>(context);
    var _user=await userModel.signInWithGoogle();
    //debugPrint("UserID "+_user.userID.toString());
  }

  void loginWithFacebook(BuildContext context) async{
    final userModel =Provider.of<UserModel>(context);
    var _user=await userModel.signInWithFaceBook();
    debugPrint("UserID "+_user.userID.toString());
  }

  void loginEmailandPassword(BuildContext context){

    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context)=>EmailandPasswordLogin(),
          fullscreenDialog: true,
        ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter WatsApp"),
        elevation: 0,
        backgroundColor: Colors.grey.shade700,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Oturum Açın",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              SocialLoginButton(
                buttonText: "Login with Google",
                textColor: Colors.black87,
                buttonIcon: Image.asset("images/google-logo.png"),
                onPressed: ()=>loginWithGoogle(context),
              ),
              SocialLoginButton(
                buttonIcon: Image.asset("images/facebook-logo.png"),
                buttonText: "Facebook Login",
                buttonColor: Color(0xFF334D92),
                radius: 16,
                onPressed: ()=>loginWithFacebook(context),
              ),
              SocialLoginButton(
                buttonText: "Login with Email",
                buttonColor: Colors.purple,
                buttonIcon: Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: ()=>loginEmailandPassword(context),
              ),
              SocialLoginButton(
                buttonText: "Guest",
                buttonIcon: Icon(Icons.verified_user),
                onPressed: ()=>_guestLogin(context),
              ),
            ],
          ),
        ),
      ),
    );
  }






}
