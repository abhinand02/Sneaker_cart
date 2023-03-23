import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Services/database.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressState.initial()) {
    on<GetAddress>((event, emit) async {
      final addressList = await DatabaseServic().getNewArrival(
          field: 'user_id',
          condition: DatabaseServic().currentUser!.uid,
          collectionObject: DatabaseServic().addressCollection);
      emit(state.copyWith(addressList: addressList));
    });
    on<IsLoading>((event, emit) {
      emit(state.copyWith(isLoading: event.loadingValue));
    });
  }
}
