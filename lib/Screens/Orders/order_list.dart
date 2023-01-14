import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Orders/order_details.dart';
import '../../Application/Orders/orders_bloc.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<OrdersBloc>(context).add(const GetOrderHistory());
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        elevation: 0,
        title: Text(
          'Orders',
          style: normalBlackText,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  if (state.orderHistory == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }
                  // print('hai');
                  // Timestamp date= (state.orderHistory!.docs[0].data() as Map<String, dynamic>) ['date'];
                  // print(date.toDate().month);
                  if (state.orderHistory!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            "No Purchase History",
                            style: mediumText,
                          ),
                          Text(
                            'Check back after your next shopping trip!',
                            style: normalText,
                          )
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = state.orderHistory!.docs[index].data()
                            as Map<String, dynamic>;
                        return ListTile(
                          onTap: () {
                            BlocProvider.of<OrdersBloc>(context)
                                .add(const GetOrderHistory());
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    OrderDetials(index: index)));
                          },
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          leading: Image.network(data['image'],
                              errorBuilder: (context, error, stackTrace) {
                            return const Text('failed to load resource');
                          }),
                          title: Text(data['product_name']),
                          // trailing:  Text(data['date']),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 15,
                          endIndent: 15,
                          thickness: 1,
                        );
                      },
                      itemCount: state.orderHistory!.docs.length);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
