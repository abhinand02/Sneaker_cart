import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Application/LazyLoading/lazy_loading_bloc.dart';
import 'package:sneaker_cart/Screens/Category/category.dart';
import 'package:sneaker_cart/Screens/settings/profile.dart';
import '../Application/BottomNavBar/bottom_nav_bar_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<LazyLoadingBloc>(context)
          .add(const started(loadingValue: false));
    });
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.selectedIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: state.selectedIndex,
            items: const [
              Icon(
                Iconsax.home,
              ),
              Icon(
                Iconsax.category,
                size: 20,
              ),
              Icon(Iconsax.bag_24),
              Icon(
                Iconsax.heart,
              ),
              Icon(
                Iconsax.user,
              ),
            ],
            onTap: (value) {
              BlocProvider.of<BottomNavBarBloc>(context)
                  .add(UpdateIndex(newIndex: value));
            },
          ),
        );
      },
    );
  }
}
