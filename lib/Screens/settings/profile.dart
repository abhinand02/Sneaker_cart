import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/auth.dart';
import 'package:sneaker_cart/Widgets/textform.dart';
import '../../Services/database.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> nameFormKey = GlobalKey();
  final GlobalKey<FormState> emailFormKey = GlobalKey();
  final GlobalKey<FormState> passwordFormKey = GlobalKey();
  File? image;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const UserDetails(newValue: true));
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color.fromARGB(4, 0, 0, 0),
        elevation: 0,
        actions: [
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return TextButton.icon(
              onPressed: () async {
                BlocProvider.of<HomeBloc>(context).add(
                    UserDetails(newValue: state.isReadOnly ? false : true));
                if (state.isReadOnly == true) {
                } else {
                  AuthService()
                      .auth
                      .currentUser!
                      .updateEmail(emailController.text);
                  AuthService()
                      .auth
                      .currentUser!
                      .updatePassword(passwordController.text);
                  DatabaseServic().updateUSerData(
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text);
                }
              },
              icon: const Icon(
                Iconsax.edit,
                size: 20,
              ),
              label: Text(
                state.isReadOnly ? 'Edit' : 'Save',
                style: normalText,
              ),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.userDetails == null) {
            return Center(
              child: Lottie.asset('assets/images/loading.json',
                  width: 100, fit: BoxFit.fill),
            );
          }
          final data = state.userDetails!.data() as Map<String, dynamic>;
          nameController = TextEditingController(text: data['name']);
          emailController = TextEditingController(text: data['email']);
          passwordController = TextEditingController(text: data['password']);

          // print(data['email']);
          return ListView(
            physics: const BouncingScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      // height: 115,
                      // width: 115,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(state.avatarChanged
                                ? 'assets/images/profile_image1.jpg'
                                : 'assets/images/profile_image2.jpeg'),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      BlocBuilder<HomeBloc, HomeState>(
                                          builder: (context, state) {
                                        return AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          actionsAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          contentPadding:
                                              const EdgeInsets.all(10),
                                          content: Text(
                                            'Choose Avatar',
                                            style: mediumText,
                                          ),
                                          actions: [
                                            GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<HomeBloc>(
                                                        context)
                                                    .add(const IsAvatarChanged(
                                                        newAvatar: true));
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: state.avatarChanged
                                                    ? 53
                                                    : 50,
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                child: const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile_image1.jpg'),
                                                  radius: 50,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<HomeBloc>(
                                                        context)
                                                    .add(const IsAvatarChanged(
                                                        newAvatar: false));
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: state.avatarChanged
                                                    ? 50
                                                    : 53,
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                child: const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile_image2.jpeg'),
                                                  radius: 50,
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      }));
                            },
                            child: Text(
                              'Change Avatar',
                              style: smallText,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  height20,
                  height10,
                  Text(
                    data['name'],
                    style: mediumText,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextForm(
                    title: 'Name',
                    hintText: 'Name',
                    controller: nameController,
                    errorMessage1: 'errorMessage1',
                    errorMessage2: 'errorMessage2',
                    regExp: RegExp(pattern),
                    formKey: nameFormKey,
                    readOnly: state.isReadOnly,
                    isObscureText: false,
                  ),
                  TextForm(
                    title: 'Email Address',
                    hintText: 'Email',
                    controller: emailController,
                    errorMessage1: 'errorMessage1',
                    errorMessage2: 'errorMessage2',
                    regExp: RegExp(pattern),
                    formKey: emailFormKey,
                    readOnly: state.isReadOnly,
                    isObscureText: false,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return TextForm(
                        title: 'Password',
                        hintText: 'Password',
                        controller: passwordController,
                        errorMessage1: 'errorMessage1',
                        errorMessage2: 'errorMessage2',
                        regExp: RegExp(pattern),
                        formKey: passwordFormKey,
                        readOnly: state.isReadOnly,
                        isObscureText: true,
                        icon: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            // BlocProvider.of<HomeBloc>(context).add(IsObscureText(
                            //     newValue: state.obscurText ? false : true));
                          },
                          icon: Icon(state.obscurText
                              ? Iconsax.eye4
                              : Iconsax.eye_slash5),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
