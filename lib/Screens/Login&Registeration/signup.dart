import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/login_page.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/appbar.dart' as appBar;
import 'Widgets/signin_signup.dart';
import '../../Widgets/textform.dart';
import 'Widgets/welcomeHeading.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController  confirmController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final confirmFormKey = GlobalKey<FormState>();
  final DatabaseServic databaseServic = DatabaseServic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar.appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WelcomHeading(
            mainText: 'Create Account',
            subText: "Let's Create Account Together",
          ),
          Column(
            children: [
              TextForm(
                regExp: RegExp(namePattern),
                errorMessage1: 'Name',
                errorMessage2: 'Enter Your Name',
                formKey: nameFormKey,
                controller: nameController,
                hintText: 'Your Name',
                title: 'Enter Your Name',
              ),
              TextForm(
                regExp: RegExp(pattern),
                errorMessage1: 'Email Address',
                errorMessage2: 'Enter a Valid Email Address',
                formKey: emailFormKey,
                controller: emailController,
                hintText: 'Enter Email Address',
                title: 'Email Address',
              ),
              TextForm(
                regExp: RegExp(passwordPattern),
                errorMessage1: 'Password',
                errorMessage2: 'Enter a Strong Password \nPassword must contain at least one uppercase letter and One Number',
                formKey: passwordFormKey,
                controller: passwordController,
                hintText: 'Enter Password',
                title: 'Password',
              ),
              TextForm(
                regExp: RegExp(passwordPattern),
                errorMessage1: 'Password again',
                errorMessage2: 'Password Does not Match',
                formKey: confirmFormKey,
                controller: confirmController,
                hintText: 'Confirm Password',
                title: 'Confirm Password',
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (nameFormKey.currentState!.validate() &&
                             emailFormKey.currentState!.validate() &&
                              passwordFormKey.currentState!.validate() &&
                              confirmFormKey.currentState!.validate()) {
                            try {
                             databaseServic.signupMethod(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context)
                                  .then((value) {
                               databaseServic.storeUserData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                );
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) =>  LoginPage(),
                                    ),
                                    (route) => false);
                              });
                            } catch (e) {
                              SnackBar(content: Text(e.toString()));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Sign In',
                            style: normalText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const GoogleSignIn()
            ],
          ),
          const SignInEitherSignUp(
            lText: 'Already have an account?',
            qText: 'Sign in',
          )
        ],
      ),
    );
  }
}

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'Sign in with Google',
                style: normalBlackText,
              ),
              icon: Image.asset(
                'assets/images/download.png',
                scale: 4,
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ],
      ),
    );
  }
}
