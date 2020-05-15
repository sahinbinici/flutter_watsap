import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watsapp/common_widgets/social_login_buttons.dart';

class SignInPage extends StatelessWidget {
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
                onPressed: () {},
              ),
              SocialLoginButton(
                buttonIcon: Image.asset("images/facebook-logo.png"),
                buttonText: "Facebook Login",
                buttonColor: Color(0xFF334D92),
                radius: 16,
                onPressed: () {},
              ),
              SocialLoginButton(
                buttonText: "Login with Email",
                buttonColor: Colors.purple,
                buttonIcon: Icon(Icons.email,size: 30,color: Colors.white,),
                onPressed: () {},
              ),
              SocialLoginButton(buttonText: "Giriş"),
            ],
          ),
        ),
      ),
    );
  }
}