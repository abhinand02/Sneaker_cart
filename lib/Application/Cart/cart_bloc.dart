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
      final data = (result.docs[0].data() as Map<String, dynamic>)['product_name'];

       emit(state.copyWith(subtotal: ''));
    });
  }
}
