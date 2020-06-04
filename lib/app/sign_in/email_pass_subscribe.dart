import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/common_widgets/social_login_buttons.dart';
import 'package:watsapp/models/user.dart';
import 'package:watsapp/view_models/user_model.dart';


enum FormType{
  Register,Login
}
class EmailandPasswordLogin extends StatefulWidget {
  @override
  _EmailandPasswordLoginState createState() => _EmailandPasswordLoginState();
}

class _EmailandPasswordLoginState extends State<EmailandPasswordLogin> {
  String _buttonText,_linkText;
  String _email,_password;
  var _formType=FormType.Login;
  final formKey=GlobalKey<FormState>();

  void _formSubmit(BuildContext context) async{
    formKey.currentState.save();
    final userModel =Provider.of<UserModel>(context);
    if(_formType==FormType.Login){
      User _userLogin=await userModel.signInWithEmailAndPassword(_email, _password);
    }else{
      User _userCreate=await userModel.createUserEmailAndPassword(_email, _password);

    }


  }

  void _degistir() {
    setState(() {
      _formType=_formType==FormType.Login ? FormType.Register : FormType.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText=_formType==FormType.Login ? "Login" : "Create Account";
    _linkText=_formType==FormType.Login ? "Create Account" : "Login";

    final userModel =Provider.of<UserModel>(context);

    if(userModel.user!=null){
      Future.delayed(Duration(seconds: 20));
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Subscribe Page"),
      ),
      body:userModel.state==ViewState.Idle ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(children: <Widget>[
            TextFormField(
              initialValue: "sahin@sahin.com",
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(prefixIcon: Icon(Icons.email),
              errorText: userModel.emailErrorMessage,
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

              initialValue: "123456",
              obscureText: true,
              decoration: InputDecoration(prefixIcon: Icon(Icons.security),
                errorText: userModel.passwordErrorMessage,
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
              buttonText: _buttonText,
              buttonColor: Theme.of(context).primaryColor,
              buttonIcon: Icon(Icons.forward),
              radius: 15,
              onPressed: ()=>_formSubmit(context),
            ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(onPressed: () => _degistir(),
                    child:Text(_linkText),

                )
          ],)),
        )
      )  : Center(child: CircularProgressIndicator(),)
    );
  }




}
