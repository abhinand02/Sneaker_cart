// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAddress,
    required TResult Function(bool loadingValue) isloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAddress,
    TResult? Function(bool loadingValue)? isloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAddress,
    TResult Function(bool loadingValue)? isloading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAddress value) getAddress,
    required TResult Function(IsLoading value) isloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAddress value)? getAddress,
    TResult? Function(IsLoading value)? isloading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAddress value)? getAddress,
    TResult Function(IsLoading value)? isloading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEventCopyWith<$Res> {
  factory $AddressEventCopyWith(
          AddressEvent value, $Res Function(AddressEvent) then) =
      _$AddressEventCopyWithImpl<$Res, AddressEvent>;
}

/// @nodoc
class _$AddressEventCopyWithImpl<$Res, $Val extends AddressEvent>
    implements $AddressEventCopyWith<$Res> {
  _$AddressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAddressCopyWith<$Res> {
  factory _$$GetAddressCopyWith(
          _$GetAddress value, $Res Function(_$GetAddress) then) =
      __$$GetAddressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAddressCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$GetAddress>
    implements _$$GetAddressCopyWith<$Res> {
  __$$GetAddressCopyWithImpl(
      _$GetAddress _value, $Res Function(_$GetAddress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAddress implements GetAddress {
  const _$GetAddress();

  @override
  String toString() {
    return 'AddressEvent.getAddress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAddress,
    required TResult Function(bool loadingValue) isloading,
  }) {
    return getAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAddress,
    TResult? Function(bool loadingValue)? isloading,
  }) {
    return getAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAddress,
    TResult Function(bool loadingValue)? isloading,
    required TResult orElse(),
  }) {
    if (getAddress != null) {
      return getAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAddress value) getAddress,
    required TResult Function(IsLoading value) isloading,
  }) {
    return getAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAddress value)? getAddress,
    TResult? Function(IsLoading value)? isloading,
  }) {
    return getAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAddress value)? getAddress,
    TResult Function(IsLoading value)? isloading,
    required TResult orElse(),
  }) {
    if (getAddress != null) {
      return getAddress(this);
    }
    return orElse();
  }
}

abstract class GetAddress implements AddressEvent {
  const factory GetAddress() = _$GetAddress;
}

/// @nodoc
abstract class _$$IsLoadingCopyWith<$Res> {
  factory _$$IsLoadingCopyWith(
          _$IsLoading value, $Res Function(_$IsLoading) then) =
      __$$IsLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loadingValue});
}

/// @nodoc
class __$$IsLoadingCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$IsLoading>
    implements _$$IsLoadingCopyWith<$Res> {
  __$$IsLoadingCopyWithImpl(
      _$IsLoading _value, $Res Function(_$IsLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingValue = null,
  }) {
    return _then(_$IsLoading(
      loadingValue: null == loadingValue
          ? _value.loadingValue
          : loadingValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsLoading implements IsLoading {
  const _$IsLoading({required this.loadingValue});

  @override
  final bool loadingValue;

  @override
  String toString() {
    return 'AddressEvent.isloading(loadingValue: $loadingValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoading &&
            (identical(other.loadingValue, loadingValue) ||
                other.loadingValue == loadingValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoadingCopyWith<_$IsLoading> get copyWith =>
      __$$IsLoadingCopyWithImpl<_$IsLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAddress,
    required TResult Function(bool loadingValue) isloading,
  }) {
    return isloading(loadingValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAddress,
    TResult? Function(bool loadingValue)? isloading,
  }) {
    return isloading?.call(loadingValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAddress,
    TResult Function(bool loadingValue)? isloading,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(loadingValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAddress value) getAddress,
    required TResult Function(IsLoading value) isloading,
  }) {
    return isloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAddress value)? getAddress,
    TResult? Function(IsLoading value)? isloading,
  }) {
    return isloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAddress value)? getAddress,
    TResult Function(IsLoading value)? isloading,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(this);
    }
    return orElse();
  }
}

abstract class IsLoading implements AddressEvent {
  const factory IsLoading({required final bool loadingValue}) = _$IsLoading;

  bool get loadingValue;
  @JsonKey(ignore: true)
  _$$IsLoadingCopyWith<_$IsLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddressState {
  QuerySnapshot<Object?>? get addressList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call({QuerySnapshot<Object?>? addressList, bool isLoading});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      addressList: freezed == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuerySnapshot<Object?>? addressList, bool isLoading});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_Initial(
      addressList: freezed == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.addressList, required this.isLoading});

  @override
  final QuerySnapshot<Object?>? addressList;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AddressState(addressList: $addressList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.addressList, addressList) ||
                other.addressList == addressList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressList, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements AddressState {
  const factory _Initial(
      {required final QuerySnapshot<Object?>? addressList,
      required final bool isLoading}) = _$_Initial;

  @override
  QuerySnapshot<Object?>? get addressList;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
