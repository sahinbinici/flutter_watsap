import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/view_models/user_model.dart';

class ProfilSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası"),
        actions: <Widget>[
          FlatButton(onPressed: () => signOut(context), child: Text("LogOut",style: TextStyle(color: Colors.white,fontSize: 12),))
        ],
      ),
      body: Center(
        child: Text("Profil"),
      ),
    );
  }

  Future<bool> signOut(BuildContext context) async {
    final userModel = Provider.of<UserModel>(context);
    var sonuc = await userModel.signOut();
    return sonuc;
  }
}
