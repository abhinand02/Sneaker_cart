part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
        required QuerySnapshot<Object?>? addressList,
        required bool isLoading,
  }) = _Initial;

  factory AddressState.initial(){
    return const AddressState(addressList: null, isLoading: false);
  }
}
