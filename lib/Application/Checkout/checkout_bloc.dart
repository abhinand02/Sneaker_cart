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
        emit(
          CheckoutState(addressList: addressList),
        );
      },
    );
  }
}
