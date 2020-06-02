import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/app/sign_in/custom_bottom_navigationbar.dart';
import 'package:watsapp/app/sign_in/tab_items.dart';
import 'package:watsapp/models/user_model.dart';
import 'package:watsapp/view_models/user_model.dart';

class HomePage extends StatefulWidget {

  final User user;
  HomePage({Key key,@required this.user}):super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItems _currentTab=TabItems.Kullanicilar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          FlatButton(onPressed: ()=>signOut(context), child: Text("Sign Out",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: CustomButtomNavigation(currentTab: _currentTab,onSelectedTab: (secilenTab){
        setState(() {
          _currentTab=secilenTab;
        });
        debugPrint("secilen tabIte"+secilenTab.toString());
      },)
      );

  }

  Future<bool> signOut(BuildContext context) async{
    final userModel =Provider.of<UserModel>(context);
    var sonuc=await userModel.signOut();
    return sonuc;
  }
}
