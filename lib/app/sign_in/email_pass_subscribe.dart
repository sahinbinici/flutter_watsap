import 'package:flutter/material.dart';
import 'package:watsapp/common_widgets/social_login_buttons.dart';

class EmailandPasswordLogin extends StatefulWidget {
  @override
  _EmailandPasswordLoginState createState() => _EmailandPasswordLoginState();
}

class _EmailandPasswordLoginState extends State<EmailandPasswordLogin> {

  String _email,_password;
  final formKey=GlobalKey<FormState>();
  _formSubmit(BuildContext context) {
      if(formKey.currentState.validate()){
        formKey.currentState.save();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Subscribe Page"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(prefixIcon: Icon(Icons.email),
              hintText: "Email",
              labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onSaved: (girilenDeger){
                this._email=girilenDeger;
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(prefixIcon: Icon(Icons.security),
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              onSaved: (girilenDeger){
                this._password=girilenDeger;
              },
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              buttonText: "Login",
              buttonColor: Theme.of(context).primaryColor,
              buttonIcon: Icon(Icons.forward),
              radius: 15,
              onPressed: ()=>_formSubmit(context),
            )
          ],)),
        )
      )
    );
  }


}
