import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Application/Orders/orders_bloc.dart';
import '../../../Constants/text.dart';
import '../order_details.dart';

class OrderListContainer extends StatelessWidget {
  const OrderListContainer({
    super.key,
    required this.orderId,
    required this.date,
    required this.noOfItems,
    required this.status,
    required this.total, required this.index,
  });

  final String orderId;
  final String date;
  final List noOfItems;
  final String status;
  final String total;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<OrdersBloc>(context).add(const GetOrderHistory());
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetials(index: index,),),);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('#$orderId', style: normalBoldText,),
            height10,
            Text(date.toString(), style: subBoldText,),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${noOfItems.length.toString()} Items', style: subBoldText,),
                Text('₹ ${total}', style: normalBoldText,),
              ],
            ),
            Divider(thickness: 2,),
            Text(status, style:  statusText,),
          ],
        ),
      ),
    );
  }
}
