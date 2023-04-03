import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/checkout.dart';
import 'package:sneaker_cart/Screens/MyCart/widgets/custom_listTile_widget.dart';
import '../../Application/Cart/cart_bloc.dart';
import '../../Constants/colors.dart';
import '../../Widgets/bottom_nav_bar.dart';
import '../../Widgets/payment_container.dart';
import 'methods/appbar.dart';

class MyCartScreen extends StatelessWidget {
  final String? address;
  final BuildContext? context1;
  MyCartScreen({super.key, this.context1, this.address,});
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
      appBar: headingAppBar(title: 'MyCart', context: context1) ,
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
              // print('hello');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/images/empty-cart-version-2.json', height: 200, width: double.infinity),
                    Text('Your Cart is Empty', style: normalText,),
                    height20,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBar(),
                            ),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Start Shopping',
                        style: normalText,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final data = state.cartProduct!.docs;
              // print('hello ${data}');
              return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(10,10,10,0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final result = (data[index].data() as Map<String, dynamic>);
                    // subtotal = subtotal + (int.parse(result['total_price']) * int.parse(result['quantity']));
                    // print(result['stock']);
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
        else{
          return state.cartProduct!.docs.isNotEmpty
            ? PaymentContainer(
                address: address ?? '',
                constructor: CheckoutScreen(),
              )
            : Container(height: 1,);
      }
        }),
    );
  }
}




