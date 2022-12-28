import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sneaker_cart/Screens/MyCart/mycart.dart';
import '../Application/Cart/cart_bloc.dart';
import '../Constants/colors.dart';
import '../Constants/text.dart';

class PaymentContainer extends StatefulWidget {
  final Widget? constructor;
  const PaymentContainer({
    Key? key,
    this.constructor,
  }) : super(key: key);

  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print('payment successful');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<CartBloc>(context).add(SubTotal());
    });
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PriceTextWidget(
              title: 'Subtotal',
              price: '₹{state.subtotal}',
            ),
            const PriceTextWidget(
              title: 'Shipping',
              price: '₹40',
            ),
            const Divider(
              thickness: 2,
            ),
            PriceTextWidget(
              title: 'Total Cost',
              price: '₹total',
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      var options = {
                        'key': 'rzp_test_ars40jMvKPCzqT',
                        'amount': 50000, //in the smallest currency sub-unit.
                        'name': 'Abhinand',
                        // 'order_id':
                        //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                        'description': 'Fine T-Shirt',
                        'timeout': 120, // in seconds
                        'prefill': {
                          'contact': '8156888469',
                          'email': 'abbhinand@1855.com'
                        }
                      };
                      widget.constructor != null
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => widget.constructor!))
                          : _razorpay.open(options);
                      // showDialog(
                      // context: context,
                      // builder: ((context) => AlertDialog(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius:
                      //               BorderRadius.circular(25)),
                      //       content: SizedBox(
                      //         height: height * .35,
                      //         // decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                      //         child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceAround,
                      //           children: [
                      //             Container(
                      //               margin: const EdgeInsets.only(
                      //                 top: 20,
                      //               ),
                      //               height: 130,
                      //               decoration: BoxDecoration(
                      //                   color: greyColor,
                      //                   shape: BoxShape.circle),
                      //               child: Image.asset(
                      //                   'assets/images/image 50.png'),
                      //             ),
                      //             Text(
                      //               'Your Payment Is \nSuccessful',
                      //               style: mediumText,
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Expanded(
                      //                     child: ElevatedButton(
                      //                   onPressed: () {},
                      //                   style: ElevatedButton.styleFrom(
                      //                       backgroundColor:
                      //                           mainColor,
                      //                       shape:
                      //                           RoundedRectangleBorder(
                      //                               borderRadius:
                      //                                   BorderRadius
                      //                                       .circular(
                      //                                           25)),
                      //                       padding:
                      //                           const EdgeInsets.all(
                      //                               20)),
                      //                   child: Text(
                      //                     'Back To Shopping',
                      //                     style: normalText,
                      //                   ),
                      //                 )),
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     )));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: mediumText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
