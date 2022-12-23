import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/Model/menu_item.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/home_screen.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  MenuITEM currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return   ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuPage(
        currentItem : currentItem,
        onSelectedItem: (item){
   setState(() {
     currentItem = item;
   });
        }
      ), mainScreen: HomeScreen(),);
  }
}