import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/Forgot%20Password/Widgets/otp_textfield.dart';
import 'package:sneaker_cart/Services/database.dart';

import '../../../Widgets/textform.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 230, 230),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Lottie.asset('assets/images/forgot-password.json',
                  repeat: false, width: 100, fit: BoxFit.fill),
            ),
            Text(
              'Forgot Password?',
              style: mediumText,
            ),
            Text(
              'Please enter your Phone Number \nto recieve a verification code',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: normalText,
            ),

            height20,

            Form(
                child: TextForm(
              title: 'Phone Number',
              hintText: 'Enter Your Phone Number',
              controller: phoneNumberController,
              errorMessage1: '',
              errorMessage2: '',
              regExp: RegExp(''),
              formKey: formKey,
              isObscureText: false,
            ),),

            ElevatedButton(onPressed: (){
          //  DatabaseServic().verification();
// DatabaseServic().VerifyPhoneNumber(phoneNumber: phoneNumberController.text, context: context);
            }, child: const Text('Send Code'),),

            //  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //    children: [
            //      OtpInput(controller1, true),
            //      OtpInput(controller2, true),
            //      OtpInput(controller3, true),
            //      OtpInput(controller4, false),
            //    ],
            //  )
          ],
        ),
      ),
    );
  }
}
