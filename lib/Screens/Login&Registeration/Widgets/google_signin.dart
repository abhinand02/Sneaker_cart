import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Application/LazyLoading/lazy_loading_bloc.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text.dart';
import '../../../Services/database.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                DatabaseServic().signInWithGoogle(context: context);
                BlocProvider.of<LazyLoadingBloc>(context).add(const started(loadingValue: true));
              },
              label: Text(  
                'Sign in with Google',
                style: normalBlackText,
              ),
              icon: Image.asset(
                'assets/images/download.png',
                scale: 4,
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ],
      ),
    );
  }
}