import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Application/Cart/cart_bloc.dart';
import '../../../Application/ProductDetails/product_details_bloc.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text.dart';
import '../../../Services/database.dart';
import '../../MyCart/mycart.dart';

class PriceAndButton extends StatelessWidget {
  final String price;
  final String productName, image;
  const PriceAndButton({
    Key? key,
    required this.price,
    required this.productName,
    required this.image,
    // required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // const Spacer(),
      Column(
        children: [
          Text(
            'Price',
            style: smallGreyText,
          ),
          Text(
            '₹$price',
            style: mediumText,
          ),
        ],
      ),
      // const Spacer(
      //   flex: 5,
      // ),
      BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
        return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (state.index != null) {
                  DatabaseServic()
                      .addToCart(
                          productName: productName,
                          image: image,
                          size: (state.index! + 6).toString(),
                          totalPrice: price,
                          quantity: '1')
                      .then((value) {
                    BlocProvider.of<CartBloc>(context).add(const CartProduct());
                    BlocProvider.of<ProductDetailsBloc>(context)
                        .add(const IsSizeSelected(newIndex: null));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyCartScreen(
                          context1: context,
                        ),
                      ),
                    );
                  });
                } else {
                  final snackbar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Select Size',
                      style: smallText,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Add To Cart',
                style: mediumText,
              ),
            );
          }
        );
      }),
      // const Spacer(),
    ]);
  }
}