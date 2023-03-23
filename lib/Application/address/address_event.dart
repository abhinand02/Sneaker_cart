part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.getAddress() = GetAddress;

  const factory AddressEvent.isloading({required bool loadingValue}) = IsLoading;
  
}