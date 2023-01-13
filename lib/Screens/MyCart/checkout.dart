import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Application/Cart/cart_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/methods/appbar.dart';
import 'package:sneaker_cart/Widgets/payment_container.dart';
import '../../Application/Checkout/checkout_bloc.dart';
import '../settings/add_and_edit_address.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  late TextEditingController emailController;
  late TextEditingController numberController;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CheckoutBloc>(context).add(const Address(index: 0));
      BlocProvider.of<CartBloc>(context).add(const SubTotal());
    });
    return Scaffold(
      appBar: headingAppBar(title: 'Checkout', context: context),
      body: Stack(
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
            if (state.addressList == null) {
              return  Center(
                child: Lottie.asset('assets/images/loading.json',width: 100,fit: BoxFit.fill),
              );
            }
            if (state.addressList!.docs.isEmpty) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddAndEditAddress()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Add Address'),
                ),
              );
            }
            String isSelectedAddress = (state.selectedAddress['name']+', '+state.selectedAddress['address']);
            final length = state.addressList!.docs.length;
            final data = state.selectedAddress;
            numberController = TextEditingController(text: data['number']);
            emailController = TextEditingController(text: state.userEmail);
            return Column(
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
                        child: Column(
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
                                child:  Icon(
                                  Iconsax.message,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                  const Text('Email'),
                                ],
                              ),
                              // trailing: IconButton(
                              //     onPressed: () {}, icon: Icon(Icons.edit)),
                            ),
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                                builder: (context, state) {
                              return ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: greyColor),
                                  child: const Icon(
                                    Icons.phone,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      readOnly: state.isEditable,
                                      controller: numberController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                    const Text('Phone'),
                                  ],
                                ),
                                trailing: state.isEditable
                                    ? IconButton(
                                        onPressed: () {
                                          BlocProvider.of<CheckoutBloc>(context)
                                              .add(EditContactNumber(
                                                  isEditable: !state.isEditable));
                                        },
                                        icon:  Icon(Iconsax.edit,color: blackColor,))
                                    : TextButton(
                                        onPressed: () {
                                          BlocProvider.of<CheckoutBloc>(context)
                                              .add(
                                            EditContactNumber(
                                                isEditable: !state.isEditable),
                                          );
                                        },
                                        child: const Text('Save')),
                              );
                            }),
                            height10,
                            ExpandablePanel(
                              header: Text(
                                'Address',
                                style: mediumText,
                              ),
                              collapsed: Text(
                                data['name']+ ', '+ data['address'],
                                style: normalText,
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              expanded: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name']+', '+data['address']+', '+data['number']+', '+data['pincode'],
                                    style: normalText,
                                    softWrap: true,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          final result = state.addressList!.docs;
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  title:
                                                      const Text('Select Address'),
                                                  content: Container(
                                                    height: 150,
                                                    width: 500,
                                                    child: ListView(
                                                      children: List.generate(
                                                        length,
                                                        (index) {
                                                          final data =
                                                              result[index].data()
                                                                  as Map<String,
                                                                      dynamic>;

                                                          return RadioListTile(
                                                              title: Text(
                                                                data['name']+', ' +data['address'],
                                                                style: normalText,
                                                                softWrap: true,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              value: data['name']+', '+data['address'],
                                                              groupValue:
                                                                  isSelectedAddress,
                                                              onChanged: (value) {
                                                                isSelectedAddress =
                                                                    value
                                                                        .toString();
                                                                BlocProvider.of<
                                                                            CheckoutBloc>(
                                                                        context)
                                                                    .add(Address(
                                                                        index:
                                                                            index));
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.all(
                                                Colors.transparent)),
                                        child: const Text('Change'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            height20
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
          BlocBuilder<CheckoutBloc,CheckoutState>(
            builder: (context,state) {
              return  Center(child: state.isLoading ? CircularProgressIndicator(strokeWidth: 2,backgroundColor: greyColor,) : Container());
            }
          )
        ],
      ),
      bottomSheet: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (contex, state) {
          final data = '${state.selectedAddress['name']+state.selectedAddress['address']+' ' +state.selectedAddress['number']+' '+state.selectedAddress['pincode']}';
          return PaymentContainer(address:data );
        }
      ),
    );
  }
}
