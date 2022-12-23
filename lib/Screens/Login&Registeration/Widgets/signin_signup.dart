import 'package:flutter/material.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/signup.dart';
import '../../../Constants/text.dart';

class SignInEitherSignUp extends StatelessWidget {
  final String qText, lText;
  const SignInEitherSignUp({
    Key? key,
    required this.qText,
    required this.lText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          qText,
          style: extraSmallGreyText,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) =>  SignUpScreen(),
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(a),
                  child: c,
                ),
              ),
            );
          },
          style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
          child: Text(
            lText,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        )
      ],
    );
  }
}
