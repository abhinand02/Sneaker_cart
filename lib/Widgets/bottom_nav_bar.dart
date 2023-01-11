import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Screens/Category/category.dart';
import 'package:sneaker_cart/Screens/settings/profile.dart';
import '../Screens/Favourite/favourite.dart';
import '../Screens/Home Screen/Drawer/zoom_drawer.dart';
import '../Screens/MyCart/mycart.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  final String id = 'home';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final _pages = [
    const HomePage(),
    const Category(),
    MyCartScreen(),
    const FavouriteScreen(),
     ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        items: const [
          Icon(Iconsax.home,),
          Icon(Iconsax.category,size: 20,),
          Icon(Iconsax.shopping_bag),
          Icon(Iconsax.heart,),
          Icon(Iconsax.user,),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
