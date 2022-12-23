import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';

AppBar myCartAppBar({required String title,required BuildContext context}) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: const Color.fromARGB(4, 0, 0, 0),
      title:  Text(
        title,
        style:const  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
      centerTitle: true,
      leading: Transform.scale(
        scale: .7,
        child: CircleAvatar(
          backgroundColor: whiteColor,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }