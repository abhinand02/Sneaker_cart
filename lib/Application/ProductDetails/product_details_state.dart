part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required Map<String, dynamic>? productdetails,
    required String? img,
    required bool? showMoreButton,
  }) = _Initial;

  factory ProductDetailsState.initial(){
    return const ProductDetailsState(productdetails: null, img: null, showMoreButton: false );
  }
}
