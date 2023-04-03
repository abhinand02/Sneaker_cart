import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/settings/about.dart';
import 'package:sneaker_cart/Screens/settings/address_list.dart';
import 'package:sneaker_cart/Screens/settings/privacy_policy.dart';
import 'package:sneaker_cart/Screens/settings/terms_and_condition.dart';
import 'package:sneaker_cart/Screens/settings/widgets/delete_account.dart';
import '../../Constants/colors.dart';
import '../Home Screen/home_screen.dart';

class AccountAndSettings extends StatelessWidget {
  AccountAndSettings({super.key});

  final List<IconData> accountSettingsList = [
    Iconsax.bag_24,
    Iconsax.trash,
  ];

  final List<IconData> appSettingsIcons = [
    Iconsax.security_safe,
    Iconsax.document_text_1,
    Iconsax.warning_2,
  ];

  final List<Widget> appSettingsPages = const [
    PrivacyPolicy(),
    TermsAndCondition(),
    About()
  ];

  final List<String> title = ['Shipping Address', 'Delete Account'];


  final List<String> appSettingsTitle = ['Privacy Policy', 'Terms and Conditions', 'About'];
  final List<Widget> pages = const [
    AddressListPage(),
    DeleteAccount(),
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
              height: 160,
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
                itemCount: 2,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return AccountSettingsListTile(
                      title: appSettingsTitle[index],
                      icon: (Iconsax.arrow_right_3),
                      leading: appSettingsIcons[index],
                      page: appSettingsPages[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 3,
              ),
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
      trailing: Icon(icon),
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
