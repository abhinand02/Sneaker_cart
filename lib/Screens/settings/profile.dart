import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/textform.dart';

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
          BlocBuilder<HomeBloc,HomeState>(
            builder: (context, state) {
              return TextButton.icon(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(const UserDetails(newValue: false));
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  label: Text(
                   state.isReadOnly? 'Edit' : 'Save',
                    style: normalText,
                  ),);
            }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.userDetails == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = state.userDetails!.data() as Map<String, dynamic>;
          nameController = TextEditingController(text: data['name']);
          emailController = TextEditingController(text: data['email']);
          passwordController = TextEditingController(text: data['password']);

          print(data['email']);
          return Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                           CircleAvatar(
                            backgroundImage: NetworkImage(data['image'])
                              ,
                          ),
                          Positioned(
                            bottom: -20,
                            right: 10,
                            child: RawMaterialButton(
                              onPressed: () async{
                               image= await DatabaseServic().getImage();
                               image != null ? DatabaseServic().updateProfileImage(profileImage: image!) : '';
                              },
                              elevation: 2.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.blue,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height20,
                  height10,
                  const Text('data'),
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
                  ),
                  TextForm(
                    title: 'Email Address',
                    hintText: 'Email',
                    controller: emailController,
                    errorMessage1: 'errorMessage1',
                    errorMessage2: 'errorMessage2',
                    regExp: RegExp(pattern),
                    formKey: emailFormKey,
                    readOnly:state.isReadOnly,
                  ),
                  TextForm(
                    title: 'Password',
                    hintText: 'Password',
                    controller: passwordController,
                    errorMessage1: 'errorMessage1',
                    errorMessage2: 'errorMessage2',
                    regExp: RegExp(pattern),
                    formKey: passwordFormKey,
                    readOnly: state.isReadOnly,
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
