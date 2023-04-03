import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sneaker_cart/Application/BottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:sneaker_cart/Screens/MyCart/mycart.dart';
import 'package:sneaker_cart/Screens/Orders/order_list.dart';
import 'package:sneaker_cart/Screens/Favourite/favourite.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/Model/menu_item.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/home_screen.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/menu_page.dart';
import 'package:sneaker_cart/Screens/settings/account_and_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _MyHomePageState();
}
final _drawerController = ZoomDrawerController();

class _MyHomePageState extends State<HomePage> {
  MenuITEM currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return   ZoomDrawer(
      controller: _drawerController,
      // closeCurve: Curves.easeInOut,
      androidCloseOnBackTap: true,
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor:  const Color.fromARGB(255, 26, 37, 48),
      menuScreen: MenuPage(
        currentItem : currentItem,
        onSelectedItem: (item){
   setState(() {
     currentItem = item;
     _drawerController.toggle!();
    //  ZoomDrawer.of(context)!.toggle();
   });
        }
      ), mainScreen: getScreen(),);
  }

  Widget getScreen(){
    switch (currentItem) {
      case MenuItems.home:
      return const HomeScreen();
      case MenuItems.favorite:
      BlocProvider.of<BottomNavBarBloc>(context).add(const UpdateIndex(newIndex: 3));
      return const FavouriteScreen();
      case MenuItems.accountAndSettings:
      return AccountAndSettings();
      case MenuItems.orders:
      return const OrderList();
      case MenuItems.myCart:
      BlocProvider.of<BottomNavBarBloc>(context).add(const UpdateIndex(newIndex: 2));
      return  MyCartScreen();
    }
    return const HomeScreen();
  }
}