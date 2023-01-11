part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
        required QuerySnapshot<Object?>? productList,
  }) = _Initial;

  factory CategoryState.initial(){
return const CategoryState(productList: null);
  }
}
