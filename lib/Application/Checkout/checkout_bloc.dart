import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Services/database.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState.initial()) {
    on<Address>(
      (event, emit) async {
        final addressList = await DatabaseServic().getNewArrival(
            field: 'user_id',
            condition: DatabaseServic().currentUser!.uid,
            collectionObject: DatabaseServic().addressCollection);
        final data =
            addressList.docs[event.index].data() as Map<String, dynamic>;
        emit(
          state.copyWith(
              addressList: addressList,
              userEmail: DatabaseServic().currentUser!.email,
              selectedAddress: data),
        );
      },
    );

    on<EditContactNumber>((event, emit) {
      emit(state.copyWith(isEditable: event.isEditable));
    });

    on<Loading>((event, emit) {
      emit(state.copyWith(isLoading: event.isLoading));
    });
  }
}
