import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaker_cart/Services/database.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<CartProduct>((event, emit) async{
      final user = DatabaseServic().currentUser;
      final result = await DatabaseServic().getNewArrival(field: 'user_id',condition: user!.uid, collectionObject: DatabaseServic().cartCollection);
      // log(data.toString());
         emit(state.copyWith(cartProduct: result),);
    });
    
    on<DecreaseQuantity>((event, emit) async{
      final user = DatabaseServic().currentUser;
      final result = await DatabaseServic().getNewArrival(field: 'user_id',condition: user!.uid, collectionObject: DatabaseServic().cartCollection);
      emit(state.copyWith(cartProduct: result));
    });


    on<SubTotal>((event, emit) async{
      final user = DatabaseServic().currentUser;
      final result = await DatabaseServic().getNewArrival(field: 'user_id',condition: user!.uid, collectionObject: DatabaseServic().cartCollection);
      final data = (result.docs);
      int subTotal=0;
        for(var i=0;i<data.length;i++){
          final res = data[i].data() as Map<String,dynamic>;
          // print(int.parse(res['total_price'])* int.parse(res['quantity']));
         subTotal= subTotal+int.parse(res['total_price'])* int.parse(res['quantity']);
        }
       emit(state.copyWith(subtotal: subTotal.toString()));
    });
  }
}
