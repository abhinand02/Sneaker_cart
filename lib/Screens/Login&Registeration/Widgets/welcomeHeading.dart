import 'package:flutter/material.dart';
import '../../../Constants/text.dart';

class WelcomHeading extends StatelessWidget {
  final String mainText, subText;
  const WelcomHeading({
    Key? key, required this.mainText, required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            mainText,
            style: bigText,
          ),
        ),
        Text(
          subText,
          style: smallGreyText,
        )
      ],
    );
  }
}