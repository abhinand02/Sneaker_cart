import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Services/database.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState.initial()) {
    on<GetProductByCategory>((event, emit) async {
      final categoryProducts = await DatabaseServic().getNewArrival(
          field: 'category',
          condition: event.categoryName,
          collectionObject: DatabaseServic().productCollection);
      emit(
        CategoryState(productList: categoryProducts),
      );
    });
  }
}
