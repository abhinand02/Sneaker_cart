import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Services/auth.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'Widgets/otp_textfield.dart';

class VerifyOTP extends StatelessWidget {
  VerifyOTP({super.key, required this.verificationId});

  final String verificationId;

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(controller1, true),
              OtpInput(controller2, true),
              OtpInput(controller3, true),
              OtpInput(controller4, true),
              OtpInput(controller5, true),
              OtpInput(controller6, false),
            ],
          ),
          ElevatedButton(onPressed: () async{
            // final smsCode = controller1.text + controller2.text + controller3.text + controller4.text + controller5.text + controller6.text;
            // try {
          //  final _credential =  PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
          //  AuthService service = AuthService();
        //  await service.auth.signInWithCredential(_credential).then((value) {
            // print('created');
          // });
            // } catch (e) {
              // print(e);
            // }
          }, child: Text('Verify'),),

        ],
      ),
    );
  }
}
