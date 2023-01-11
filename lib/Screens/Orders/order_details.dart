import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Application/Orders/orders_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
import '../../Constants/colors.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(builder: (context, state) {
        if (state.orderHistory == null) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        final data =
            state.orderHistory!.docs[index].data() as Map<String, dynamic>;
        final address = data['address'].toString().split(',').toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 80),
                      height: 150,
                      color: mainColor,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            'Order Id : ${state.orderHistory!.docs[index].id}',
                            style: normalBlackText,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.transparent,
                      width: double.infinity,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ]),
                    height: 80,
                    width: width - 20,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order',
                              style: TextStyle(
                                fontSize: 18,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Placed'),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Status',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold)),
                            Text(data['order_status']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ListTile(
              title: Text(
                data['product_name'],
                style: mediumText,
              ),
              subtitle: Text(
                'quantity: ${data['quantity']}',
                style: smallText,
              ),
              trailing: Image(
                image: NetworkImage(data['image']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹${((int.parse(data['total']) - 40) / int.parse(data['quantity'])).toString().split('.').first}',
                    style: mediumText,
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  Text(
                    'Shipping Details',
                    style: mediumText,
                  ),
                  ListTile(
                      leading: const Icon(Icons.location_on_rounded, color: Color.fromARGB(255, 248, 113, 103),),
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              address.length,
                              (index) => Text(
                                    address[index],
                                    style: smallText,
                                    textAlign: TextAlign.left,
                                  )))),
                  const Divider(
                    thickness: 5,
                  ),
                  Text(
                    'Price Details',
                    style: mediumText,
                  ),
                  height20,
                  priceDetails(
                      title: 'Price',
                      value:
                          '₹${((int.parse(data['total']) - 40) / int.parse(data['quantity'])).toString().split('.').first}'),
                  priceDetails(title: 'Quantity', value: data['quantity']),
                  priceDetails(title: 'Total', value: '₹${data['total']}'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Padding priceDetails({required String title, required value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: normalText),
          Text(
            value,
            style: normalText,
          )
        ],
      ),
    );
  }
}

