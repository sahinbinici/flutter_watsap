import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsapp/app/sign_in/tab_items.dart';

class CustomButtomNavigation extends StatelessWidget {
  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectedTab;
  final Map<TabItems, Widget> sayfaOlusturucu;
  final Map<TabItems,GlobalKey<NavigatorState>> navigatorKeys;

  const CustomButtomNavigation(
      {Key key,
      @required this.currentTab,
      @required this.onSelectedTab,
      @required this.sayfaOlusturucu, this.navigatorKeys})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          navItemOlustur(TabItems.Kullanicilar),
          navItemOlustur(TabItems.Profil),
        ],
        onTap: (index) => onSelectedTab(TabItems.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItems.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[gosterilecekItem],
          builder: (context) {
            return sayfaOlusturucu[gosterilecekItem];
          },
        );
      },
    );
  }

  BottomNavigationBarItem navItemOlustur(TabItems tabItems) {
    final olusturalacakTab = TabItemData.tumTablar[tabItems];

    return BottomNavigationBarItem(
        icon: Icon(olusturalacakTab.icon), title: Text(olusturalacakTab.title));
  }
}
