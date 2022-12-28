part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required QuerySnapshot<Object?>? addressList,
    // required QuerySnapshot<Object?>? userEmailAndPassword,
  }) = _Initial;

  factory CheckoutState.initial(){
    return const CheckoutState(addressList: null);
  }
}
