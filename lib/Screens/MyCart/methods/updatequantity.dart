import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Constants/text.dart';
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
return  AlertDialog(content:  Text('Do you want to remove this item from cart', style: normalText,),
actionsAlignment: MainAxisAlignment.spaceBetween,
actions: [
  TextButton(onPressed: () {
    Navigator.of(context).pop();
  }, child: const Text('No', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),)),
  TextButton(onPressed: () async{
   await DatabaseServic().removeItem(productName: productName, size: size, quantity: quantity, context: context);
    Navigator.of(context).pop();
  }, child: const Text('Yes', style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w800),),)
],);
                        });
}
