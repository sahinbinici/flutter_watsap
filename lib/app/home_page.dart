import 'package:flutter/material.dart';
import 'package:watsapp/app/sign_in/custom_bottom_navigationbar.dart';
import 'package:watsapp/app/sign_in/kullanicilar.dart';
import 'package:watsapp/app/sign_in/profil_sayfasi.dart';
import 'package:watsapp/app/sign_in/tab_items.dart';
import 'package:watsapp/models/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItems _currentTab = TabItems.Kullanicilar;
  Map<TabItems,GlobalKey<NavigatorState>> navigatorKeys={
    TabItems.Kullanicilar:GlobalKey<NavigatorState>(),
    TabItems.Profil:GlobalKey<NavigatorState>()
  };
  Map<TabItems, Widget> tumSayfalar() {
    return {
      TabItems.Kullanicilar: KullanicilarPage(),
      TabItems.Profil: ProfilSayfasi(),

    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async =>!await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CustomButtomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        navigatorKeys:navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
          if(secilenTab==_currentTab){
              navigatorKeys[secilenTab].currentState.popUntil((route) =>route.isFirst);
          }else{
            setState(() {
              _currentTab = secilenTab;
            });
          }
        },
      ),
    );
  }
}

/*
*
*
*
* */
