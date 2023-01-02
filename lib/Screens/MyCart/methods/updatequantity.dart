import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Application/Cart/cart_bloc.dart';
import '../../../Services/database.dart';

updateQuantity({
  required String productName,
  required size,
  required quantity,
  required context,
}) async{
 await DatabaseServic()
      .updateQuantity(productName: productName, size: size, quantity: quantity)
      .then((value) {
    BlocProvider.of<CartBloc>(context).add(const CartProduct());
    BlocProvider.of<CartBloc>(context).add(const SubTotal());
  });
}

updateQuantityShowDialog({
  required String productName,
  required size,
  required quantity,
  required context,
}){
  showDialog(context: context, builder: (context){
return  AlertDialog(content: const Text('Do you want to remove this item from cart'),
actionsAlignment: MainAxisAlignment.spaceBetween,
actions: [
  TextButton(onPressed: () {
    Navigator.of(context).pop();
  }, child: const Text('No')),
  TextButton(onPressed: () async{
   await updateQuantity(productName: productName, size: size, quantity: quantity, context: context);
    Navigator.of(context).pop();
  }, child: const Text('Yes'),)
],);
                        });
}
