import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Application/Home/home_bloc.dart';
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
  bool isObscureText;
  IconButton? icon;

  TextForm(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.errorMessage1,
      required this.errorMessage2,
      required this.regExp,
      required this.formKey,
      required this.isObscureText,
      this.icon,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<HomeBloc>(context).add(const IsObscureText(newValue: true));
    });
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
            child: BlocBuilder<HomeBloc,HomeState>(
              builder: (context,state) {
                return TextFormField(
                  obscuringCharacter: '●',
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
                  obscureText: isObscureText,
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: icon,
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
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
