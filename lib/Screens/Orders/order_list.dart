import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';  
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import '../../Application/Orders/orders_bloc.dart';
import 'Widgets/order_list_container.dart';

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
        leading: IconButton(onPressed: (){
          ZoomDrawer.of(context)!.toggle();
        }, icon:  Icon(Icons.arrow_back_rounded, color: blackColor,),),
        elevation: 0,
        title: Text(
          'Orders',
          style: normalBlackText,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<OrdersBloc, OrdersState>(
                  builder: (context, state) {
                    // final data = (state.orderHistory[0].data()) as Map<String, dynamic>;
                    // print(data['order'][0]['product_name']);
                    if (state.orderHistory == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    }
                    // print('hai');
                    if (state.orderHistory.isEmpty) {
                      return Center(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                          final data = state.orderHistory[index].data()
                              as Map<String, dynamic>;
                          DateTime date = Timestamp.fromMillisecondsSinceEpoch(
                                  data['date'].millisecondsSinceEpoch) 
                              .toDate();
                          String dateOnly =
                              DateFormat('dd-MM-yyyy').format(date);
                          return OrderListContainer(
                            orderId: state.orderHistory[index].id,
                            noOfItems: data['order'],
                            date: dateOnly,
                            status: data['order_status'],
                            total: data['total_price'],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return height50;
                        },
                        itemCount: state.orderHistory.length);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
