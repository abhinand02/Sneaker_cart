part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required QuerySnapshot<Object?>? cartProduct,
    required String subtotal,
  }) = _Initial;

  factory CartState.initial(){
    return const CartState(cartProduct: null,subtotal: '');
  }
}
