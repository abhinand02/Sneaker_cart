// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryEvent {
  String get categoryName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryName) getProductByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryName)? getProductByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryName)? getProductByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductByCategory value) getProductByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductByCategory value)? getProductByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductByCategory value)? getProductByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEventCopyWith<CategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
  @useResult
  $Res call({String categoryName});
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetProductByCategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$GetProductByCategoryCopyWith(_$GetProductByCategory value,
          $Res Function(_$GetProductByCategory) then) =
      __$$GetProductByCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryName});
}

/// @nodoc
class __$$GetProductByCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$GetProductByCategory>
    implements _$$GetProductByCategoryCopyWith<$Res> {
  __$$GetProductByCategoryCopyWithImpl(_$GetProductByCategory _value,
      $Res Function(_$GetProductByCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
  }) {
    return _then(_$GetProductByCategory(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductByCategory implements GetProductByCategory {
  const _$GetProductByCategory({required this.categoryName});

  @override
  final String categoryName;

  @override
  String toString() {
    return 'CategoryEvent.getProductByCategory(categoryName: $categoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductByCategory &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductByCategoryCopyWith<_$GetProductByCategory> get copyWith =>
      __$$GetProductByCategoryCopyWithImpl<_$GetProductByCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String categoryName) getProductByCategory,
  }) {
    return getProductByCategory(categoryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String categoryName)? getProductByCategory,
  }) {
    return getProductByCategory?.call(categoryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String categoryName)? getProductByCategory,
    required TResult orElse(),
  }) {
    if (getProductByCategory != null) {
      return getProductByCategory(categoryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductByCategory value) getProductByCategory,
  }) {
    return getProductByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductByCategory value)? getProductByCategory,
  }) {
    return getProductByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductByCategory value)? getProductByCategory,
    required TResult orElse(),
  }) {
    if (getProductByCategory != null) {
      return getProductByCategory(this);
    }
    return orElse();
  }
}

abstract class GetProductByCategory implements CategoryEvent {
  const factory GetProductByCategory({required final String categoryName}) =
      _$GetProductByCategory;

  @override
  String get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$GetProductByCategoryCopyWith<_$GetProductByCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  QuerySnapshot<Object?>? get productList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call({QuerySnapshot<Object?>? productList});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = freezed,
  }) {
    return _then(_value.copyWith(
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuerySnapshot<Object?>? productList});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = freezed,
  }) {
    return _then(_$_Initial(
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.productList});

  @override
  final QuerySnapshot<Object?>? productList;

  @override
  String toString() {
    return 'CategoryState(productList: $productList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.productList, productList) ||
                other.productList == productList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CategoryState {
  const factory _Initial({required final QuerySnapshot<Object?>? productList}) =
      _$_Initial;

  @override
  QuerySnapshot<Object?>? get productList;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
