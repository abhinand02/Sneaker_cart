part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required QuerySnapshot<Object?>? addressList,
    required String? userEmail,
    required bool isEditable,
    required bool isLoading,
    required Map<String, dynamic> selectedAddress,
  }) = _Initial;

  factory CheckoutState.initial(){
    return const CheckoutState(addressList: null, userEmail: null, isEditable: true, selectedAddress: {}, isLoading: false);
  }
}
