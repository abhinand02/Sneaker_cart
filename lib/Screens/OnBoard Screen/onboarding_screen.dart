import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/login_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Login',
        pageBackgroundColor: const Color.fromARGB(255, 213, 209, 209),
        totalPage: 2,
        headerBackgroundColor: const Color.fromARGB(255, 213, 209, 209), 
        onFinish: (){
          return Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
        },
        background: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset('assets/images/onboard1.png'),
          ),
          Image.asset('assets/images/onboard2.png'),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children:  [
                SizedBox(
                  height: height/2,
                ),
                const Text(
                  'Start Journey With Us',
                  style: TextStyle(fontSize: 50),
                ),
                const Text(
                  'Smart, Gorgeous & Fashionable Collection',
                  style: TextStyle(fontSize: 24, height: 1.5),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
              child: Column(
            children: [
              SizedBox(
                height: height/2,
              ),
              const Text(
                'Follow Latest Style Shoes',
                style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,),
              ),
height10,
              Text('There are Many Beautiful And Attractive Plants To Your Room.', style: mediumGreyText,)
            ],
          )),
        ],
      ),
    );
  }
}
