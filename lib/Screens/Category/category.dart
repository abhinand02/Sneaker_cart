import 'package:flutter/material.dart';
import 'package:sneaker_cart/Screens/MyCart/methods/appbar.dart';
import 'methods/custom_container.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headingAppBar(title: 'Category',),
      body: SafeArea(
        child: GridView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .8, crossAxisCount: 2),
          children: [
             categoryGridViewContainer(img: 'assets/images/mensshoes.jpg', categoryName: 'Mens', context: context),
             categoryGridViewContainer(img: 'assets/images/womensshoes.jpg', categoryName: 'Womens', context: context),
        ]  ),
        ),
      );
  }
}
