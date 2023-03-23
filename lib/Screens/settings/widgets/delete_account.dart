import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/auth.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'Delete Account'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delete Account',
                  style: mediumText,
                ),
                height20,
                Text(
                  'Permanently delete your account and all data associated with it. if you experienced an issue with your account and need help, please contact us so we can assist you.',
                  style: normalBlackText,
                ),
                height20,
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            title: Text(
                              'Delete Account',
                              style: mediumText,
                            ),
                            content: Text(
                              'Are you sure you want to delete your account?',
                              style: normalText,
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey),
                                child: Text(
                                  'Cancel',
                                  style: normalText,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (DatabaseServic().currentUser != null) {
                                    // AuthService().auth.signOut();
                                    AuthService().auth.currentUser!.delete();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent),
                                child: Text(
                                  'Delete',
                                  style: normalText,
                                ),
                              )
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  child: Text(
                    'DELETE ACCOUNT',
                    style: smallText,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

bottomsheet(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      });
}
