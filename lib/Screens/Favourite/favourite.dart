import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          trailingIcon: Icons.favorite_outline_rounded, title: 'Favourite'),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: 2,
            childAspectRatio: .8),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity / 2,
                  // height: 500,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: greyColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        // margin: const EdgeInsets.fromLTRB(8,8,0,0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: whiteColor),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.red,
                            )),
                      ),
                      Image.asset(
                        'assets/images/product.png',
                        scale: 1.9,
                      ),
                      Text(
                        'Nike Jordan',
                        style: mediumText,
                      ),
                      Text(
                        '₹849',
                        style: normalText,
                      ),
                      height10,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
