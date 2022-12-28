import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/database.dart';

import '../../Constants/colors.dart';

class AddAndEditAddress extends StatelessWidget {
  AddAndEditAddress({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  GlobalKey<FormState> nameFormKey = GlobalKey();
  GlobalKey<FormState> addressFormKey = GlobalKey();
  GlobalKey<FormState> numberFormKey = GlobalKey();
  GlobalKey<FormState> stateFormKey = GlobalKey();
  GlobalKey<FormState> pinFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
              'Shipping Address',
              style: mediumText,
            ),),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          children: [
            height20,
            CustomTextFields(
              hintText: 'Enter Name',
              keyboardType: TextInputType.text,
              formKey: nameFormKey,
              controller: nameController,
            ),
            CustomTextFields(
              hintText: 'Address',
              keyboardType: TextInputType.text,
              formKey: addressFormKey,
              controller: addressController,
            ),
            CustomTextFields(
              hintText: 'Number',
              keyboardType: TextInputType.number,
              formKey: numberFormKey,
              controller: numberController,
            ),
            CustomTextFields(
              hintText: 'State',
              keyboardType: TextInputType.text,
              formKey: stateFormKey,
              controller: stateController,
            ),
            CustomTextFields(
              hintText: 'Pin Code',
              keyboardType: TextInputType.number,
              formKey: pinFormKey,
              controller: pinController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameFormKey.currentState!.validate() &&
                        stateFormKey.currentState!.validate() &&
                        numberFormKey.currentState!.validate() &&
                        pinFormKey.currentState!.validate() &&
                        addressFormKey.currentState!.validate()) {
                      DatabaseServic().addAddress(
                          name: nameController.text,
                          address: addressController.text,
                          state: stateController.text,
                          pincode: pinController.text,
                          phnnumber: numberController.text,
                          context: context);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFields extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  const CustomTextFields({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            filled: true,
            fillColor: whiteColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: whiteColor),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field!';
            }
          },
        ),
      ),
    );
  }
}
