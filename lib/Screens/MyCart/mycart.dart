import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/checkout.dart';
import 'package:sneaker_cart/Screens/MyCart/methods/updatequantity.dart';
import 'package:sneaker_cart/Services/database.dart';
import '../../Application/Cart/cart_bloc.dart';
import '../../Constants/colors.dart';
import '../../Widgets/bottom_nav_bar.dart';
import '../../Widgets/payment_container.dart';
import 'methods/appbar.dart';

class MyCartScreen extends StatelessWidget {
  final String? address;
  final BuildContext? context1;
  MyCartScreen({super.key, this.context1, this.address});
  int subtotal = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartBloc>(context).add(const CartProduct());
      BlocProvider.of<CartBloc>(context).add(const SubTotal());
      subtotal = 0;
    });
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      appBar: headingAppBar(title: 'MyCart', context: context1),
      body: Padding(
        padding: EdgeInsets.only(bottom: height * .3),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.cartProduct == null) {
              return Center(
                child: Lottie.asset('assets/images/loading.json',
                    width: 100, fit: BoxFit.fill),
              );
            }
            if (state.cartProduct!.docs.isEmpty) {
              return Center(
                child: Text(
                  'Cart is Empty',
                  style: mediumText,
                ),
              );
            } else {
              final data = state.cartProduct!.docs;
              // print('hello ${productList}');
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final result = (data[index].data() as Map<String, dynamic>);
                    // subtotal = subtotal + (int.parse(result['total_price']) * int.parse(result['quantity']));
                    // print(subtotal);
                    return CustomeListTile(
                      productName: result['product_name'],
                      img: result['image'],
                      price: result['total_price'],
                      quantity: result['quantity'].toString(),
                      size: result['size'],
                      // subTotal: subtotal.toString(),
                    );
                  },
                  separatorBuilder: (context, index) => height20,
                  itemCount: data.length);
            }
          },
        ),
      ),
      bottomSheet: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state.cartProduct == null) {
          return const Text('');
        }
        return state.cartProduct!.docs.isNotEmpty
            ? PaymentContainer(
                address: address ?? '',
                constructor: CheckoutScreen(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBar(),
                            ),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Start Shopping',
                        style: normalText,
                      ),
                    ),
                  ),
                ],
              );
      }),
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
  final String img, productName, price, quantity, size;
  const CustomeListTile({
    Key? key,
    required this.img,
    required this.productName,
    required this.quantity,
    required this.size,
    required this.price,
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
          child: Image.network(img, errorBuilder: (context, error, stackTrace) {
            return const Text('failed to load resource');
          }),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: normalText,
            ),
            height10,
            Text(
              price,
              style: normalText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (int.parse(quantity) <= 1) {
                          updateQuantityShowDialog(
                              productName: productName,
                              size: size,
                              quantity: quantity,
                              context: context);
                        } else {
                          updateQuantity(
                              productName: productName,
                              size: size,
                              quantity: quantity,
                              context: context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: whiteColor,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const Icon(
                        Iconsax.minus,
                        color: Colors.black,
                        size: 20,
                      ),
                    );
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    // final data = state.cartProduct.docs
                    return Text(
                      quantity,
                      // state.cartProduct,
                      style: normalText,
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    DatabaseServic()
                        .addToCart(
                            productName: productName,
                            image: img,
                            size: size,
                            quantity: quantity,
                            totalPrice: price)
                        .then((value) {
                      BlocProvider.of<CartBloc>(context)
                          .add(const CartProduct());
                      BlocProvider.of<CartBloc>(context).add(SubTotal());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: mainColor,
                      splashFactory: NoSplash.splashFactory),
                  child: const Icon(Iconsax.add),
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
              onPressed: () {
                updateQuantityShowDialog(
                    productName: productName,
                    size: size,
                    quantity: quantity,
                    context: context);
              },
              icon: const Icon(
                Iconsax.trash4,
                size: 23,
              ),
            )
          ],
        ),
      ],
    );
  }
}
