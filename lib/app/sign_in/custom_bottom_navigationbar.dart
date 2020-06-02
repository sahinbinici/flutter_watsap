import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsapp/app/sign_in/tab_items.dart';

class CustomButtomNavigation extends StatelessWidget {

  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectedTab;

  const CustomButtomNavigation({Key key, @required this.currentTab,@required this.onSelectedTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: [
        navItemOlustur(TabItems.Kullanicilar),
        navItemOlustur(TabItems.Profil),
      ],
      onTap:(index)=> onSelectedTab(TabItems.values[index]),
    ),
    tabBuilder:(context,index){
      return CupertinoTabView(
        builder: (context){
          return Container(
            child: Text("Test"),
          );
        },
      );
    },);
  }

  BottomNavigationBarItem navItemOlustur(TabItems tabItems){
    final olusturalacakTab=TabItemData.tumTablar[tabItems];

      return BottomNavigationBarItem(
        icon: Icon(olusturalacakTab.icon),
        title: Text(olusturalacakTab.title)
      );
  }
}
