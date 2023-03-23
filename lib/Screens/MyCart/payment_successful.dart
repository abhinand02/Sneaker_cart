import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Application/Checkout/checkout_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';

import '../../Widgets/bottom_nav_bar.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Lottie.asset('assets/images/payment-succesful-animation.json',repeat: false),
          height20,
          ElevatedButton(
            onPressed: () {
          // BlocProvider.of<CheckoutBloc>(context).add(const Loading(isLoading: false),);
          BlocProvider.of<CheckoutBloc>(context).add(const Address(index: 0,),);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) {
            return const BottomNavBar();
          }), (route) => false);
            },
            style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(20),
            ),
            child: Text(
          'Back To Shopping',
          style: normalText,
            ),
          )
        ],
      ),
    );
  }
}
