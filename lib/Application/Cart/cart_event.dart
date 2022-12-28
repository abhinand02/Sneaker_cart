part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.cartProduct() = CartProduct;

  const factory CartEvent.decreaseQuantity() = DecreaseQuantity;

  const factory CartEvent.subTotal() = SubTotal;
  
  
}