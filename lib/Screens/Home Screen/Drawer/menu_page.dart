import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/Model/menu_item.dart';
import 'widgets/profile_widget.dart';
import 'widgets/signout_widget.dart';

class MenuItems {
  static const home = MenuITEM('Home', Icons.home_outlined);
  static const accountAndSettings =
      MenuITEM('Account & Settings', Icons.person_outline_outlined);
  static const myCart = MenuITEM('MyCart', Icons.shopping_bag_outlined);
  static const favorite = MenuITEM('Favorite', Icons.favorite_border_rounded);
  static const orders = MenuITEM('Orders', Icons.fire_truck_outlined);

  static const all = <MenuITEM>[
    home,
    accountAndSettings,
    myCart,
    favorite,
    orders
  ];
}

class MenuPage extends StatelessWidget {
  final MenuITEM currentItem;
  final ValueChanged<MenuITEM> onSelectedItem;
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 37, 48),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const ProfileWidget(),
          // const Spacer(),
          height20,
          height20,
          ...MenuItems.all.map(buildMenuItem).toList(),
          const Spacer(
            flex: 2,
          ),
          Divider(
            color: greyColor,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SignOutButtonWidget(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuITEM item) => ListTileTheme(
    selectedColor: whiteColor,
    child: ListTile(
      textColor: whiteColor,
          selectedTileColor: greyColor,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(
            item.icon,
            color: const Color.fromARGB(255, 112, 123, 129),
          ),
          title: Text(
            item.title,
            style: normalText,
          ),
          onTap: () {
            onSelectedItem(item);
          },
        ),
  );
}




