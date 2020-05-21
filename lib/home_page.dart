import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/view_models/user_model.dart';

class HomePage extends StatelessWidget {

  final User user;
  HomePage({Key key,@required this.user}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          FlatButton(onPressed: ()=>signOut(context), child: Text("Sign Out",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Center(
        child: Text("Welcome "+user.userID)),
      );

  }

  Future<bool> signOut(BuildContext context) async{
    final userModel =Provider.of<UserModel>(context);
    var sonuc=await userModel.signOut();
    return sonuc;
  }
}
