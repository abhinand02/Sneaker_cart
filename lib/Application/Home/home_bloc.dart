import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaker_cart/Services/database.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<_Started>((event, emit) async {
      // print('hi');
      final data = await DatabaseServic().getData();
      final newArrivals = await DatabaseServic().getNewArrival(
          field: 'new',
          condition: true,
          collectionObject: DatabaseServic().productCollection);
      // log(data.toString());
      emit(state.copyWith(productList: data, newArrival: newArrivals));
    });

    on<UserDetails>((event, emit) async {
      final userId = DatabaseServic().currentUser!.uid;
      final data = await DatabaseServic().usersCollection.doc(userId).get();
      // print(data);
      emit(state.copyWith(userDetails: data, isReadOnly: event.newValue));
    });

    on<searchResult>((event, emit) async {
      final data =
          await DatabaseServic().searchResult(searchKey: event.searchKey);
      emit(
        state.copyWith(searchResult: data),
      );
    });
  }
}
