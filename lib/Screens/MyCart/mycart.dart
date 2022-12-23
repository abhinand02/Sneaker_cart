import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/checkout.dart';
import '../../Constants/colors.dart';
import '../../Widgets/payment_container.dart';
import 'methods/appbar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      appBar: myCartAppBar(title: 'MyCart', context: context),
      body: Padding(
        padding: EdgeInsets.only(bottom: height * .3),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const CustomeListTile();
            },
            separatorBuilder: (context, index) => height20,
            itemCount: 10),
      ),
      bottomSheet: const PaymentContainer(
        constructor: CheckoutScreen(),
      ),
    );
  }
}

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

class CustomeListTile extends StatelessWidget {
  const CustomeListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 90,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(25)),
          child: Image.asset('assets/images/product.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nike Club Max',
              style: normalText,
            ),
            height10,
            Text(
              '₹6400',
              style: normalText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: whiteColor,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                Text(
                  '1',
                  style: normalText,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: mainColor,
                      splashFactory: NoSplash.splashFactory),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '7',
              style: normalText,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  size: 28,
                ))
          ],
        ),
      ],
    );
  }
}
