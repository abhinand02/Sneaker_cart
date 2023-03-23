import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import '../../../../Constants/text.dart';
import '../../../../Services/auth.dart';
import '../../../Login&Registeration/login_page.dart';

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        AuthService().auth.signOut().then((value) => Navigator.of(context)
            .pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false));
      },
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Iconsax.logout,
          color: whiteColor,
        ),
      ),
      label: Text(
        'Sign Out',
        style: mediumTextWhite,
      ),
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
    );
  }
}
