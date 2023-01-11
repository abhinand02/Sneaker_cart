import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';

TextStyle bigText= const TextStyle(fontSize: 30,height: 1.9,fontWeight: FontWeight.w600);

TextStyle normalText= const TextStyle(fontSize: 18,fontWeight: FontWeight.w600);

TextStyle smallText = const TextStyle(fontSize: 15,wordSpacing: 1);

TextStyle smallGreyText = const  TextStyle(fontSize: 18,height: 1.9,color: Color.fromARGB(255, 112, 123, 123),fontStyle: FontStyle.italic,fontWeight: FontWeight.w700);

TextStyle extraSmallGreyText = const  TextStyle(fontSize: 15,color: Color.fromARGB(255, 112, 123, 123),fontStyle: FontStyle.italic,fontWeight: FontWeight.w600);

TextStyle mediumText = const TextStyle(fontSize: 23,fontWeight: FontWeight.w600);

SizedBox height10 = const SizedBox(height: 10,);

SizedBox height20  = const SizedBox(height: 20,);

TextStyle mediumTextWhite =  TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: whiteColor);

TextStyle mediumGreyText =  const TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 112, 123, 123));

TextStyle normalBlackText = const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500);

String pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";

String passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';  


String namePattern = '[a-zA-Z]';