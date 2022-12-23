import 'package:flutter/material.dart';
import '../../../../Constants/colors.dart';
import '../../../../Constants/text.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 40,
          ),
          height10,
          Text(
            'Hey,👋',
            style: TextStyle(color: whiteColor, fontSize: 22),
          ),
          Text(
            'Abhinand',
            style: TextStyle(
              color: whiteColor,
              fontSize: 25,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}