import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sneaker_cart/Constants/colors.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Login',
        pageBackgroundColor: Colors.white,
        totalPage: 2,
        headerBackgroundColor: Colors.white,
        background: [
          
             Padding(
               padding: const EdgeInsets.only(top: 50),
               child: Image.asset('assets/images/onboard1.png'),
             ),
          Image.asset('assets/images/onboard2.png'),
        ],
        speed: 1.8,        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Column(
              children: const[
                SizedBox(
                  height: 400,
                ),
                Text('Start Journey With Us',style: TextStyle(fontSize: 50),),
                Text('Smart, Gorgeous & Fashionable Collection',style: TextStyle(fontSize: 24,height: 1.5),),
              ],
            ),
          ),
          Text('Screen 2'),
        ],
      ),
    );
  }
}