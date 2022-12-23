part of 'product_details_bloc.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.getProductDetail({
    required String productname,
  }) = GetProductDetail;

    const factory ProductDetailsEvent.changeImage({
    required int index,
    required String productname,
  }) = ChangeImage;

  const factory ProductDetailsEvent.showMoreButton({
    required bool showMore,
  }) = ShowMoreButton;
  
}