import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/Drawer/Model/menu_item.dart';
import 'widgets/profile_widget.dart';
import 'widgets/signout_widget.dart';

class MenuItems {
  static const home = MenuITEM('Home', Iconsax.home);
  static const accountAndSettings =
      MenuITEM('Account & Settings', Iconsax.profile_tick);
  static const myCart = MenuITEM('MyCart', Iconsax.bag_24);
  static const favorite = MenuITEM('Favorite', Iconsax.heart);
  static const orders = MenuITEM('Orders', Iconsax.truck);

  static const all = <MenuITEM>[
    home,
    myCart,
    favorite,
    orders,
    accountAndSettings,
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
        children: [
          const Spacer(),
          ProfileWidget(),
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




