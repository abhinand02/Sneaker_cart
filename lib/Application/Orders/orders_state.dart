part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    required QuerySnapshot<Object?>? orderHistory,
  }) = _Initial;

  factory OrdersState.initial(){
    return  const OrdersState(orderHistory: null);
  }
}
