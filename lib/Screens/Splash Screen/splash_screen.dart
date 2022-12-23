import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/login_page.dart';
import '../OnBoard Screen/onBoarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        goToNext(context);
    return const Scaffold(
      body: Image(
        image: AssetImage(
          'assets/images/Splash_image.jpeg',
        ),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
    Timer goToNext(context){
   return Timer(const Duration(seconds:2), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  LoginPage())));
  }
}
