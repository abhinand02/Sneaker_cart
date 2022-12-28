// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartProduct,
    required TResult Function() decreaseQuantity,
    required TResult Function() subTotal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartProduct,
    TResult? Function()? decreaseQuantity,
    TResult? Function()? subTotal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartProduct,
    TResult Function()? decreaseQuantity,
    TResult Function()? subTotal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartProduct value) cartProduct,
    required TResult Function(DecreaseQuantity value) decreaseQuantity,
    required TResult Function(SubTotal value) subTotal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartProduct value)? cartProduct,
    TResult? Function(DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(SubTotal value)? subTotal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartProduct value)? cartProduct,
    TResult Function(DecreaseQuantity value)? decreaseQuantity,
    TResult Function(SubTotal value)? subTotal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CartProductCopyWith<$Res> {
  factory _$$CartProductCopyWith(
          _$CartProduct value, $Res Function(_$CartProduct) then) =
      __$$CartProductCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartProductCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CartProduct>
    implements _$$CartProductCopyWith<$Res> {
  __$$CartProductCopyWithImpl(
      _$CartProduct _value, $Res Function(_$CartProduct) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartProduct implements CartProduct {
  const _$CartProduct();

  @override
  String toString() {
    return 'CartEvent.cartProduct()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartProduct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartProduct,
    required TResult Function() decreaseQuantity,
    required TResult Function() subTotal,
  }) {
    return cartProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartProduct,
    TResult? Function()? decreaseQuantity,
    TResult? Function()? subTotal,
  }) {
    return cartProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartProduct,
    TResult Function()? decreaseQuantity,
    TResult Function()? subTotal,
    required TResult orElse(),
  }) {
    if (cartProduct != null) {
      return cartProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartProduct value) cartProduct,
    required TResult Function(DecreaseQuantity value) decreaseQuantity,
    required TResult Function(SubTotal value) subTotal,
  }) {
    return cartProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartProduct value)? cartProduct,
    TResult? Function(DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(SubTotal value)? subTotal,
  }) {
    return cartProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartProduct value)? cartProduct,
    TResult Function(DecreaseQuantity value)? decreaseQuantity,
    TResult Function(SubTotal value)? subTotal,
    required TResult orElse(),
  }) {
    if (cartProduct != null) {
      return cartProduct(this);
    }
    return orElse();
  }
}

abstract class CartProduct implements CartEvent {
  const factory CartProduct() = _$CartProduct;
}

/// @nodoc
abstract class _$$DecreaseQuantityCopyWith<$Res> {
  factory _$$DecreaseQuantityCopyWith(
          _$DecreaseQuantity value, $Res Function(_$DecreaseQuantity) then) =
      __$$DecreaseQuantityCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecreaseQuantityCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DecreaseQuantity>
    implements _$$DecreaseQuantityCopyWith<$Res> {
  __$$DecreaseQuantityCopyWithImpl(
      _$DecreaseQuantity _value, $Res Function(_$DecreaseQuantity) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DecreaseQuantity implements DecreaseQuantity {
  const _$DecreaseQuantity();

  @override
  String toString() {
    return 'CartEvent.decreaseQuantity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DecreaseQuantity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartProduct,
    required TResult Function() decreaseQuantity,
    required TResult Function() subTotal,
  }) {
    return decreaseQuantity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartProduct,
    TResult? Function()? decreaseQuantity,
    TResult? Function()? subTotal,
  }) {
    return decreaseQuantity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartProduct,
    TResult Function()? decreaseQuantity,
    TResult Function()? subTotal,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartProduct value) cartProduct,
    required TResult Function(DecreaseQuantity value) decreaseQuantity,
    required TResult Function(SubTotal value) subTotal,
  }) {
    return decreaseQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartProduct value)? cartProduct,
    TResult? Function(DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(SubTotal value)? subTotal,
  }) {
    return decreaseQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartProduct value)? cartProduct,
    TResult Function(DecreaseQuantity value)? decreaseQuantity,
    TResult Function(SubTotal value)? subTotal,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity(this);
    }
    return orElse();
  }
}

abstract class DecreaseQuantity implements CartEvent {
  const factory DecreaseQuantity() = _$DecreaseQuantity;
}

/// @nodoc
abstract class _$$SubTotalCopyWith<$Res> {
  factory _$$SubTotalCopyWith(
          _$SubTotal value, $Res Function(_$SubTotal) then) =
      __$$SubTotalCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubTotalCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$SubTotal>
    implements _$$SubTotalCopyWith<$Res> {
  __$$SubTotalCopyWithImpl(_$SubTotal _value, $Res Function(_$SubTotal) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubTotal implements SubTotal {
  const _$SubTotal();

  @override
  String toString() {
    return 'CartEvent.subTotal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubTotal);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartProduct,
    required TResult Function() decreaseQuantity,
    required TResult Function() subTotal,
  }) {
    return subTotal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartProduct,
    TResult? Function()? decreaseQuantity,
    TResult? Function()? subTotal,
  }) {
    return subTotal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartProduct,
    TResult Function()? decreaseQuantity,
    TResult Function()? subTotal,
    required TResult orElse(),
  }) {
    if (subTotal != null) {
      return subTotal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartProduct value) cartProduct,
    required TResult Function(DecreaseQuantity value) decreaseQuantity,
    required TResult Function(SubTotal value) subTotal,
  }) {
    return subTotal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartProduct value)? cartProduct,
    TResult? Function(DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(SubTotal value)? subTotal,
  }) {
    return subTotal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartProduct value)? cartProduct,
    TResult Function(DecreaseQuantity value)? decreaseQuantity,
    TResult Function(SubTotal value)? subTotal,
    required TResult orElse(),
  }) {
    if (subTotal != null) {
      return subTotal(this);
    }
    return orElse();
  }
}

abstract class SubTotal implements CartEvent {
  const factory SubTotal() = _$SubTotal;
}

/// @nodoc
mixin _$CartState {
  QuerySnapshot<Object?>? get cartProduct => throw _privateConstructorUsedError;
  String get subtotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({QuerySnapshot<Object?>? cartProduct, String subtotal});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProduct = freezed,
    Object? subtotal = null,
  }) {
    return _then(_value.copyWith(
      cartProduct: freezed == cartProduct
          ? _value.cartProduct
          : cartProduct // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuerySnapshot<Object?>? cartProduct, String subtotal});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProduct = freezed,
    Object? subtotal = null,
  }) {
    return _then(_$_Initial(
      cartProduct: freezed == cartProduct
          ? _value.cartProduct
          : cartProduct // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.cartProduct, required this.subtotal});

  @override
  final QuerySnapshot<Object?>? cartProduct;
  @override
  final String subtotal;

  @override
  String toString() {
    return 'CartState(cartProduct: $cartProduct, subtotal: $subtotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.cartProduct, cartProduct) ||
                other.cartProduct == cartProduct) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartProduct, subtotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CartState {
  const factory _Initial(
      {required final QuerySnapshot<Object?>? cartProduct,
      required final String subtotal}) = _$_Initial;

  @override
  QuerySnapshot<Object?>? get cartProduct;
  @override
  String get subtotal;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
