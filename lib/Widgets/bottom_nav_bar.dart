import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/home_screen.dart';
import '../Screens/Favourite/favourite.dart';
import '../Screens/Home Screen/Drawer/zoom_drawer.dart';
import '../Screens/MyCart/mycart.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int currentIndex = 0;
 final _pages =  [
   const HomePage(),
  const HomePage(),
   MyCartScreen(),
  const FavouriteScreen(),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        
        items: const [
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.category_outlined, size: 30),
          Icon(Icons.shopping_bag_outlined, size: 30),
          Icon(Icons.favorite_border_rounded, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap:(value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}