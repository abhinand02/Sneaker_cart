part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.address({required int index,}) = Address; 

  const factory CheckoutEvent.editContactNumber({
    required bool isEditable,
  }) = EditContactNumber;

  const factory CheckoutEvent.selectedAddress({required int index}) = SelectedAddress;
  
  const factory CheckoutEvent.loading({
    required bool isLoading,
  }) = Loading;

}