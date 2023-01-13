import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/firebase_constants.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/Widgets/signin_signup.dart';
import 'package:sneaker_cart/Screens/Login&Registeration/signup.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/bottom_nav_bar.dart';
import '../../Constants/colors.dart';
import '../../Constants/text.dart';
import '../../Widgets/appbar.dart' as appbar;
import '../../Widgets/textform.dart';
import 'Widgets/welcomeHeading.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar.appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WelcomHeading(
            mainText: 'Hello Again!',
            subText: '''Welcome Back You've Been Missed!''',
          ),
          Column(
            children: [
              TextForm(
                regExp: RegExp(pattern),
                errorMessage1: 'Email Address',
                errorMessage2: 'Enter a Valid Email Address',
                formKey: emailFormKey,
                hintText: 'Email Address',
                title: 'Email Address',
                controller: emailController,
                isObscureText: false,
              ),
              TextForm(
                regExp: RegExp(passwordPattern),
                errorMessage1: 'Password',
                errorMessage2: 'Enter a Valid Password',
                formKey: passwordFormKey,
                controller: passwordController,
                hintText: 'Password',
                title: 'Password',
                isObscureText: true,
              ),
            ],
          ),
          Column(
            children: [
              LoginButton(
                emailFormKey: emailFormKey,
                passwordFormKey: passwordFormKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const GoogleSignIn(),
            ],
          ),
          const SignInEitherSignUp(
              qText: '''Don’t have an account?''', lText: 'Sign Up for free')
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton(
      {Key? key,
      required this.emailFormKey,
      required this.passwordFormKey,
      required this.emailController,
      required this.passwordController,})
      : super(key: key);

  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> passwordFormKey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                DatabaseServic().getData();
                if (emailFormKey.currentState!.validate() &&
                    passwordFormKey.currentState!.validate()) {
                 DatabaseServic().loginMethod(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context);}
                      // .then((value) {
                    
                  // },);
                // }
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
    );
  }
}

// Future<UserCredential?> loginMethod({email, password, context}) async {
//   UserCredential? userCredential;

//   try {
//     userCredential =
//         await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
//           Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                           builder: (context) => const BottomNavBar(),
//                         ),
//                         (route) => false);
//         });
//   } on FirebaseAuthException catch (e) {
//     print('qwer $e');
//     final snackbar =SnackBar(content: Text(e.toString()));
 
//    ScaffoldMessenger.of(context).showSnackBar(snackbar);
//   }
//   return userCredential;
// }

// Future<UserCredential?> signupMethod({email, password, context}) async {
//   UserCredential? userCredential;

//   try {
//     userCredential = await auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//   } on FirebaseAuthException catch (e) {
//    final snackBar = SnackBar(content: Text(e.toString()));

//    ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//   return userCredential;
// }

// storeUserData({name, password, email}) async {
//   DocumentReference store =
//       firestore.collection(usersCollection).doc(currentUser!.uid);
//   store.set({
//     'name': name,
//     'password': password,
//     'email': email,
//     'imageUrl': '',
//     'cart' : FieldValue.arrayUnion([{
//       'product_name' : '',
//         'image' : '',
//         'size' : '',
//         'quantity' : '',
//         'total_price' : '',
//     }])
//   });
// }
