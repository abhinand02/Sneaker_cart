import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaker_cart/Services/database.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState.initial()) {
    on<GetOrderHistory>((event, emit) async{
      List<QueryDocumentSnapshot<Object?>> data = await DatabaseServic().getOrders();
      // print(data[0]['user_id']);
      emit(OrdersState(orderHistory: data));
    });
  }
}
