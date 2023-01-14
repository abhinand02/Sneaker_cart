import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import '../../../../Constants/colors.dart';
import '../../../../Constants/text.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const UserDetails(newValue: true));
    });
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.userDetails == null) {
            return Container();
          }
          final data = state.userDetails!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user-profile.png'),
                radius: 40,
              ),
              height10,
              Text(
                'Hey,👋',
                style: TextStyle(color: whiteColor, fontSize: 22),
              ),
              Text(
                data['name'] ?? 'User',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 25,
                  height: 2,
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}