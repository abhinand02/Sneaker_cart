import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';

AppBar appBar({ String? title,IconData? trailingIcon, BuildContext? context}) {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: const Color.fromARGB(4, 0, 0, 0),
    title: Text(
      title ?? '',
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
    leading: context !=null ? Transform.scale(
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
           context !=null ? Navigator.of(context).pop() : '';
          },
        ),
      ),
    ) : Container(),
    actions: [
      trailingIcon != null
          ? Transform.scale(
              scale: .7,
              child: CircleAvatar(
                backgroundColor: whiteColor,
                radius: 28,
                child: IconButton(
                  onPressed: () {},
                  icon: 
                  Icon(
                    trailingIcon,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
            )
          : const Spacer(),
    ],
    elevation: 0,
  );
}
