import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sneaker_cart/Screens/Favourite/favourite.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/Model/menu_item.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/home_screen.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/menu_page.dart';
import 'package:sneaker_cart/Screens/settings/account_and_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  MenuITEM currentItem = MenuItems.home;
  @override
  Widget build(BuildContext ctx) {
    return   ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor:  const Color.fromARGB(255, 26, 37, 48),
      menuScreen: MenuPage(
        currentItem : currentItem,
        onSelectedItem: (item){
   setState(() {
     currentItem = item;
     ZoomDrawer.of(context)?.close();
   });
        }
      ), mainScreen: getScreen(),);
  }

  Widget getScreen(){
    switch (currentItem) {
      case MenuItems.home:
      return HomeScreen();
      case MenuItems.favorite:
      return FavouriteScreen();
      case MenuItems.accountAndSettings:
      return AccountAndSettings();
    }
    return HomeScreen();
  }
}