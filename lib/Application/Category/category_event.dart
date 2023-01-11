part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.getProductByCategory({
    required String categoryName,
  }) = GetProductByCategory;
}