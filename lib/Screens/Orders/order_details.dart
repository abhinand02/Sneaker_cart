import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sneaker_cart/Application/Orders/orders_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text('Order Details'),

        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state.orderHistory == null) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
            final data =
                state.orderHistory[index].data() as Map<String, dynamic>;
            final address = data['address'].toString().split(',').toList();
            DateTime date = Timestamp.fromMillisecondsSinceEpoch(
                    data['date'].millisecondsSinceEpoch)
                .toDate();
            String dateOnly = DateFormat('dd-MM-yyyy').format(date);
            // print(address);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.orderHistory[index].id,
                              style: normalBoldText,
                            ),
                            height10,
                            Text(
                              dateOnly,
                              style: subBoldText,
                            ),
                          ],
                        ),
                        Text(
                          data['order_status'],
                          style: statusText,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Delivered to',
                      style: normalText,
                    ),
                    subtitle: Text(
                      data['address'].toString(),
                      style: normalBoldText,
                    ),
                  ),
                  height20,
                  const Divider(),
                  Column(
                    children: List.generate(
                      data['order'].length,
                      (index) => ListTile(
                        leading: Image(
                          image: NetworkImage(data['order'][index]['image']),
                        ),
                        title: Text(
                          '${data['order'][index]['product_name']}  x${data['order'][index]['quantity']}',
                          style: normalText,
                        ),
                        trailing: Text(
                          '₹${int.parse(data['order'][index]['total']) * int.parse(data['order'][index]['quantity'])}',
                          style: normalBoldText,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                      title: Text(
                        'item total',
                        style: normalText,
                      ),
                      trailing: Text(
                        (int.parse(data['total_price']) - 40).toString(),
                        style: normalText,
                      ),
                      dense: true,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4)),
                  ListTile(
                      title: Text('Shipping charge', style: normalText),
                      trailing: Text('₹40', style: normalText),
                      dense: true,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4)),
                  ListTile(
                    title: Text('total', style: normalText),
                    trailing:
                        Text('₹${data['total_price']}', style: normalText),
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    dense: true,
                  ),
                ],
              ),
            );
          },
        ));
  }
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
