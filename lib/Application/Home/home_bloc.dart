import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaker_cart/Services/database.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<_Started>((event, emit) async{
      // print('hi');
      final data = await DatabaseServic().getData();
      final newArrivals = await DatabaseServic().getNewArrival('new', true);
      log(data.toString());
      emit(HomeState(productList: data, newArrival: newArrivals));
    });
  }
}
