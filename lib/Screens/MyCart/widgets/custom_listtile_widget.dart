import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/product_details.dart';
import '../../../Application/Cart/cart_bloc.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text.dart';
import '../../../Services/database.dart';
import '../methods/updatequantity.dart';

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
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
            // onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailsScreen(category: 'category'),),),
            child: Image.network(img, errorBuilder: (context, error, stackTrace) {
              return const Text('failed to load resource');
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width - 170,
                child: Text(
                  productName,
                  style: normalText,
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                ),
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
                              totalPrice: price,)
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
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              size,
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
