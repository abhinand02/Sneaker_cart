import 'package:flutter/material.dart';
import '../../../Constants/text.dart';

class PriceTextWidget extends StatelessWidget {
  final String title, price;
  const PriceTextWidget({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: smallGreyText,
        ),
        Text(
          price,
          style: normalText,
        )
      ],
    );
  }
}