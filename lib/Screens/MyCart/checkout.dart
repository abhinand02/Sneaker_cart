import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/methods/appbar.dart';
import 'package:sneaker_cart/Widgets/payment_container.dart';
import '../../Application/Checkout/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CheckoutBloc>(context).add(const Address());
    });
    return Scaffold(
      appBar: myCartAppBar(title: 'Checkout', context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor),
                  child: BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if(state.addressList == null ||  state.addressList!.docs.isEmpty){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      final data = state.addressList!.docs[0].data();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(
                            'Contact Information',
                            style: mediumText,
                          ),
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyColor),
                              child: const Icon(
                                Icons.email_outlined,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  initialValue: 'abhinand@gmail.com',
                                ),
                                Text('Email'),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ),
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyColor),
                              child: Icon(
                                Icons.phone,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                                const Text('Phone'),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ),
                          height10,
                          ExpandablePanel(
                            header: Text(
                              'Address',
                              style: mediumText,
                            ),
                            collapsed: Text(
                              'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                              style: normalText,
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                                  style: normalText,
                                  softWrap: true,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent)),
                                  child: const Text('Change'),
                                ),
                              ],
                            ),
                          ),
                          height20
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: const PaymentContainer(),
    );
  }
}
