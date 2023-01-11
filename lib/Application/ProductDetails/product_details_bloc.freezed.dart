// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsEventCopyWith<$Res> {
  factory $ProductDetailsEventCopyWith(
          ProductDetailsEvent value, $Res Function(ProductDetailsEvent) then) =
      _$ProductDetailsEventCopyWithImpl<$Res, ProductDetailsEvent>;
}

/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res, $Val extends ProductDetailsEvent>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetProductDetailCopyWith<$Res> {
  factory _$$GetProductDetailCopyWith(
          _$GetProductDetail value, $Res Function(_$GetProductDetail) then) =
      __$$GetProductDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({String productname});
}

/// @nodoc
class __$$GetProductDetailCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$GetProductDetail>
    implements _$$GetProductDetailCopyWith<$Res> {
  __$$GetProductDetailCopyWithImpl(
      _$GetProductDetail _value, $Res Function(_$GetProductDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productname = null,
  }) {
    return _then(_$GetProductDetail(
      productname: null == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductDetail implements GetProductDetail {
  const _$GetProductDetail({required this.productname});

  @override
  final String productname;

  @override
  String toString() {
    return 'ProductDetailsEvent.getProductDetail(productname: $productname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductDetail &&
            (identical(other.productname, productname) ||
                other.productname == productname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductDetailCopyWith<_$GetProductDetail> get copyWith =>
      __$$GetProductDetailCopyWithImpl<_$GetProductDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) {
    return getProductDetail(productname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) {
    return getProductDetail?.call(productname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) {
    if (getProductDetail != null) {
      return getProductDetail(productname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) {
    return getProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) {
    return getProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) {
    if (getProductDetail != null) {
      return getProductDetail(this);
    }
    return orElse();
  }
}

abstract class GetProductDetail implements ProductDetailsEvent {
  const factory GetProductDetail({required final String productname}) =
      _$GetProductDetail;

  String get productname;
  @JsonKey(ignore: true)
  _$$GetProductDetailCopyWith<_$GetProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeImageCopyWith<$Res> {
  factory _$$ChangeImageCopyWith(
          _$ChangeImage value, $Res Function(_$ChangeImage) then) =
      __$$ChangeImageCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String productname});
}

/// @nodoc
class __$$ChangeImageCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$ChangeImage>
    implements _$$ChangeImageCopyWith<$Res> {
  __$$ChangeImageCopyWithImpl(
      _$ChangeImage _value, $Res Function(_$ChangeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? productname = null,
  }) {
    return _then(_$ChangeImage(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      productname: null == productname
          ? _value.productname
          : productname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeImage implements ChangeImage {
  const _$ChangeImage({required this.index, required this.productname});

  @override
  final int index;
  @override
  final String productname;

  @override
  String toString() {
    return 'ProductDetailsEvent.changeImage(index: $index, productname: $productname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeImage &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.productname, productname) ||
                other.productname == productname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, productname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeImageCopyWith<_$ChangeImage> get copyWith =>
      __$$ChangeImageCopyWithImpl<_$ChangeImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) {
    return changeImage(index, productname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) {
    return changeImage?.call(index, productname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(index, productname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class ChangeImage implements ProductDetailsEvent {
  const factory ChangeImage(
      {required final int index,
      required final String productname}) = _$ChangeImage;

  int get index;
  String get productname;
  @JsonKey(ignore: true)
  _$$ChangeImageCopyWith<_$ChangeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowMoreButtonCopyWith<$Res> {
  factory _$$ShowMoreButtonCopyWith(
          _$ShowMoreButton value, $Res Function(_$ShowMoreButton) then) =
      __$$ShowMoreButtonCopyWithImpl<$Res>;
  @useResult
  $Res call({bool showMore});
}

/// @nodoc
class __$$ShowMoreButtonCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$ShowMoreButton>
    implements _$$ShowMoreButtonCopyWith<$Res> {
  __$$ShowMoreButtonCopyWithImpl(
      _$ShowMoreButton _value, $Res Function(_$ShowMoreButton) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showMore = null,
  }) {
    return _then(_$ShowMoreButton(
      showMore: null == showMore
          ? _value.showMore
          : showMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowMoreButton implements ShowMoreButton {
  const _$ShowMoreButton({required this.showMore});

  @override
  final bool showMore;

  @override
  String toString() {
    return 'ProductDetailsEvent.showMoreButton(showMore: $showMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowMoreButton &&
            (identical(other.showMore, showMore) ||
                other.showMore == showMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowMoreButtonCopyWith<_$ShowMoreButton> get copyWith =>
      __$$ShowMoreButtonCopyWithImpl<_$ShowMoreButton>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) {
    return showMoreButton(showMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) {
    return showMoreButton?.call(showMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) {
    if (showMoreButton != null) {
      return showMoreButton(showMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) {
    return showMoreButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) {
    return showMoreButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) {
    if (showMoreButton != null) {
      return showMoreButton(this);
    }
    return orElse();
  }
}

abstract class ShowMoreButton implements ProductDetailsEvent {
  const factory ShowMoreButton({required final bool showMore}) =
      _$ShowMoreButton;

  bool get showMore;
  @JsonKey(ignore: true)
  _$$ShowMoreButtonCopyWith<_$ShowMoreButton> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsFavCopyWith<$Res> {
  factory _$$IsFavCopyWith(_$IsFav value, $Res Function(_$IsFav) then) =
      __$$IsFavCopyWithImpl<$Res>;
  @useResult
  $Res call({String prodctName});
}

/// @nodoc
class __$$IsFavCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$IsFav>
    implements _$$IsFavCopyWith<$Res> {
  __$$IsFavCopyWithImpl(_$IsFav _value, $Res Function(_$IsFav) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prodctName = null,
  }) {
    return _then(_$IsFav(
      prodctName: null == prodctName
          ? _value.prodctName
          : prodctName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IsFav implements IsFav {
  const _$IsFav({required this.prodctName});

  @override
  final String prodctName;

  @override
  String toString() {
    return 'ProductDetailsEvent.isFav(prodctName: $prodctName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsFav &&
            (identical(other.prodctName, prodctName) ||
                other.prodctName == prodctName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prodctName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsFavCopyWith<_$IsFav> get copyWith =>
      __$$IsFavCopyWithImpl<_$IsFav>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) {
    return isFav(prodctName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) {
    return isFav?.call(prodctName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) {
    if (isFav != null) {
      return isFav(prodctName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) {
    return isFav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) {
    return isFav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) {
    if (isFav != null) {
      return isFav(this);
    }
    return orElse();
  }
}

abstract class IsFav implements ProductDetailsEvent {
  const factory IsFav({required final String prodctName}) = _$IsFav;

  String get prodctName;
  @JsonKey(ignore: true)
  _$$IsFavCopyWith<_$IsFav> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavProductCopyWith<$Res> {
  factory _$$FavProductCopyWith(
          _$FavProduct value, $Res Function(_$FavProduct) then) =
      __$$FavProductCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavProductCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$FavProduct>
    implements _$$FavProductCopyWith<$Res> {
  __$$FavProductCopyWithImpl(
      _$FavProduct _value, $Res Function(_$FavProduct) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavProduct implements FavProduct {
  const _$FavProduct();

  @override
  String toString() {
    return 'ProductDetailsEvent.favProduct()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavProduct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productname) getProductDetail,
    required TResult Function(int index, String productname) changeImage,
    required TResult Function(bool showMore) showMoreButton,
    required TResult Function(String prodctName) isFav,
    required TResult Function() favProduct,
  }) {
    return favProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productname)? getProductDetail,
    TResult? Function(int index, String productname)? changeImage,
    TResult? Function(bool showMore)? showMoreButton,
    TResult? Function(String prodctName)? isFav,
    TResult? Function()? favProduct,
  }) {
    return favProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productname)? getProductDetail,
    TResult Function(int index, String productname)? changeImage,
    TResult Function(bool showMore)? showMoreButton,
    TResult Function(String prodctName)? isFav,
    TResult Function()? favProduct,
    required TResult orElse(),
  }) {
    if (favProduct != null) {
      return favProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductDetail value) getProductDetail,
    required TResult Function(ChangeImage value) changeImage,
    required TResult Function(ShowMoreButton value) showMoreButton,
    required TResult Function(IsFav value) isFav,
    required TResult Function(FavProduct value) favProduct,
  }) {
    return favProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductDetail value)? getProductDetail,
    TResult? Function(ChangeImage value)? changeImage,
    TResult? Function(ShowMoreButton value)? showMoreButton,
    TResult? Function(IsFav value)? isFav,
    TResult? Function(FavProduct value)? favProduct,
  }) {
    return favProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductDetail value)? getProductDetail,
    TResult Function(ChangeImage value)? changeImage,
    TResult Function(ShowMoreButton value)? showMoreButton,
    TResult Function(IsFav value)? isFav,
    TResult Function(FavProduct value)? favProduct,
    required TResult orElse(),
  }) {
    if (favProduct != null) {
      return favProduct(this);
    }
    return orElse();
  }
}

abstract class FavProduct implements ProductDetailsEvent {
  const factory FavProduct() = _$FavProduct;
}

/// @nodoc
mixin _$ProductDetailsState {
  Map<String, dynamic>? get productdetails =>
      throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  bool? get showMoreButton => throw _privateConstructorUsedError;
  bool get isFavorited => throw _privateConstructorUsedError;
  List<QueryDocumentSnapshot<Object?>>? get favProducts =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
  @useResult
  $Res call(
      {Map<String, dynamic>? productdetails,
      String? img,
      bool? showMoreButton,
      bool isFavorited,
      List<QueryDocumentSnapshot<Object?>>? favProducts});
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productdetails = freezed,
    Object? img = freezed,
    Object? showMoreButton = freezed,
    Object? isFavorited = null,
    Object? favProducts = freezed,
  }) {
    return _then(_value.copyWith(
      productdetails: freezed == productdetails
          ? _value.productdetails
          : productdetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      showMoreButton: freezed == showMoreButton
          ? _value.showMoreButton
          : showMoreButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      favProducts: freezed == favProducts
          ? _value.favProducts
          : favProducts // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic>? productdetails,
      String? img,
      bool? showMoreButton,
      bool isFavorited,
      List<QueryDocumentSnapshot<Object?>>? favProducts});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productdetails = freezed,
    Object? img = freezed,
    Object? showMoreButton = freezed,
    Object? isFavorited = null,
    Object? favProducts = freezed,
  }) {
    return _then(_$_Initial(
      productdetails: freezed == productdetails
          ? _value._productdetails
          : productdetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      showMoreButton: freezed == showMoreButton
          ? _value.showMoreButton
          : showMoreButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
      favProducts: freezed == favProducts
          ? _value._favProducts
          : favProducts // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final Map<String, dynamic>? productdetails,
      required this.img,
      required this.showMoreButton,
      required this.isFavorited,
      required final List<QueryDocumentSnapshot<Object?>>? favProducts})
      : _productdetails = productdetails,
        _favProducts = favProducts;

  final Map<String, dynamic>? _productdetails;
  @override
  Map<String, dynamic>? get productdetails {
    final value = _productdetails;
    if (value == null) return null;
    if (_productdetails is EqualUnmodifiableMapView) return _productdetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? img;
  @override
  final bool? showMoreButton;
  @override
  final bool isFavorited;
  final List<QueryDocumentSnapshot<Object?>>? _favProducts;
  @override
  List<QueryDocumentSnapshot<Object?>>? get favProducts {
    final value = _favProducts;
    if (value == null) return null;
    if (_favProducts is EqualUnmodifiableListView) return _favProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductDetailsState(productdetails: $productdetails, img: $img, showMoreButton: $showMoreButton, isFavorited: $isFavorited, favProducts: $favProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._productdetails, _productdetails) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.showMoreButton, showMoreButton) ||
                other.showMoreButton == showMoreButton) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited) &&
            const DeepCollectionEquality()
                .equals(other._favProducts, _favProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productdetails),
      img,
      showMoreButton,
      isFavorited,
      const DeepCollectionEquality().hash(_favProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ProductDetailsState {
  const factory _Initial(
          {required final Map<String, dynamic>? productdetails,
          required final String? img,
          required final bool? showMoreButton,
          required final bool isFavorited,
          required final List<QueryDocumentSnapshot<Object?>>? favProducts}) =
      _$_Initial;

  @override
  Map<String, dynamic>? get productdetails;
  @override
  String? get img;
  @override
  bool? get showMoreButton;
  @override
  bool get isFavorited;
  @override
  List<QueryDocumentSnapshot<Object?>>? get favProducts;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
