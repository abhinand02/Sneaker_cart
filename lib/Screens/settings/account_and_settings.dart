import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/payment_successful.dart';
import 'package:sneaker_cart/Screens/settings/add_and_edit_address.dart';
import 'package:sneaker_cart/Screens/settings/address_list.dart';
import '../../Constants/colors.dart';
import '../Home Screen/home_screen.dart';

class AccountAndSettings extends StatelessWidget {
  AccountAndSettings({super.key});

  final List<IconData> accountSettingsList = [
    Icons.shopping_cart_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.delete_outline_rounded,
  ];

  final List<String> title = [
    'Shipping Address',
    'Payment Info',
    'Delete Account'
  ];
  final List<Widget> pages = [
    AddressListPage(),
    AddAndEditAddress(),
    PaymentSuccessful(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: mediumText,
            ),
            const Divider(),
            Container(
              height: 220,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return AccountSettingsListTile(
                    title: title[index],
                    leading: accountSettingsList[index],
                    icon: Icons.arrow_forward_ios_rounded,
                    page: pages[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 3,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              'App Settings',
              style: mediumText,
            ),
            ListTile(
              leading: Text(
                'Dark Mode',
                style: smallGreyText,
              ),
              trailing: Switch(value: false, onChanged: (value) {}),
            )
          ],
        ),
      ),
    );
  }
}

class AccountSettingsListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData leading;
  final Widget page;
  const AccountSettingsListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.leading,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => page)),
      title: Text(
        title,
        style: smallGreyText,
      ),
      leading: Icon(leading),
      trailing: IconButton(onPressed: () {}, icon: Icon(icon)),
    );
  }
}

AppBar appBar() {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    title: Text('Account & Settings'),
    leading: Transform.scale(
      scale: .7,
      child:
          CircleAvatar(backgroundColor: whiteColor, child: const MenuWidget()),
    ),
    elevation: 0,
  );
}
