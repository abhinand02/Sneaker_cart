import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../Constants/text.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String title, hintText;
  GlobalKey<FormState> formKey;
  String errorMessage1;
  String errorMessage2;
  RegExp regExp;
  bool readOnly;

  TextForm(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.errorMessage1,
      required this.errorMessage2,
      required this.regExp,
      required this.formKey,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: normalText,
          ),
          height10,
          Form(
            key: formKey,
            child: TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                print(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your $errorMessage1';
                } else if (!regExp.hasMatch(value)) {
                  return errorMessage2;
                } else {
                  return null;
                }
              },
              readOnly: readOnly,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: whiteColor,
                    width: 0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                hintText: hintText,
                filled: true,
                fillColor: whiteColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
