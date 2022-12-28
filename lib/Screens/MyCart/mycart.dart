import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/checkout.dart';
import 'package:sneaker_cart/Services/database.dart';
import '../../Application/Cart/cart_bloc.dart';
import '../../Constants/colors.dart';
import '../../Widgets/payment_container.dart';
import 'methods/appbar.dart';

class MyCartScreen extends StatelessWidget {
    MyCartScreen({super.key});
      int subtotal = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartBloc>(context).add(const CartProduct());
      BlocProvider.of<CartBloc>(context).add(SubTotal());
      subtotal=0;
    });
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      appBar: myCartAppBar(title: 'MyCart', context: context),
      body: Padding(
        padding: EdgeInsets.only(bottom: height * .3),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.cartProduct == null) {
              return const Center(
                child: Text('Cart is Empty \nShop Now'),
              );
            }
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
          },
        ),
      ),
      bottomSheet:  const PaymentContainer(
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
  final String img, productName, price, quantity, size;
  const CustomeListTile(
      {Key? key,
      required this.img,
      required this.productName,
      required this.quantity,
      required this.size,
      required this.price,})
      : super(key: key);

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
          child: Image.network(img),
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
                        DatabaseServic()
                            .updateQuantity(
                                productName: productName,
                                size: size,
                                quantity: quantity)
                            .then((value) => BlocProvider.of<CartBloc>(context)
                                .add(const CartProduct()));
                              
                      },
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
                        .then(
                          (value) => BlocProvider.of<CartBloc>(context).add(
                            const CartProduct(),
                          ),
                        );
                  },
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
