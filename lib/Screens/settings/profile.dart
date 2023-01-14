import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
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
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(
                    UserDetails(newValue: state.isReadOnly ? false : true));
                // Bo
                if (state.isReadOnly == true) {
                } else {
                  DatabaseServic().updateUSerData(name: nameController.text, password: passwordController.text);

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
            physics: const NeverScrollableScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Center(
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/user-profile.png'),
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
                    readOnly: true,
                    isObscureText: false,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    return TextForm(
                      title: 'Password',
                      hintText: 'Password',
                      controller: passwordController,
                      errorMessage1: 'errorMessage1',
                      errorMessage2: 'errorMessage2',
                      regExp: RegExp(pattern),
                      formKey: passwordFormKey,
                      readOnly: state.isReadOnly,
                      isObscureText: state.obscurText,
                      icon: IconButton(
                        splashRadius: 20,
                          onPressed: () {
                            BlocProvider.of<HomeBloc>(context).add(
                                IsObscureText(
                                    newValue: state.obscurText ? false : true));
                          },
                          icon:  Icon(state.obscurText ? Iconsax.eye4 : Iconsax.eye_slash5),),
                    );
                  }),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
