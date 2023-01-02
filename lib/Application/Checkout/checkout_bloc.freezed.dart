// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) address,
    required TResult Function(bool isEditable) editContactNumber,
    required TResult Function(int index) selectedAddress,
    required TResult Function(bool isLoading) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? address,
    TResult? Function(bool isEditable)? editContactNumber,
    TResult? Function(int index)? selectedAddress,
    TResult? Function(bool isLoading)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? address,
    TResult Function(bool isEditable)? editContactNumber,
    TResult Function(int index)? selectedAddress,
    TResult Function(bool isLoading)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Address value) address,
    required TResult Function(EditContactNumber value) editContactNumber,
    required TResult Function(SelectedAddress value) selectedAddress,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Address value)? address,
    TResult? Function(EditContactNumber value)? editContactNumber,
    TResult? Function(SelectedAddress value)? selectedAddress,
    TResult? Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Address value)? address,
    TResult Function(EditContactNumber value)? editContactNumber,
    TResult Function(SelectedAddress value)? selectedAddress,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddressCopyWith<$Res> {
  factory _$$AddressCopyWith(_$Address value, $Res Function(_$Address) then) =
      __$$AddressCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$AddressCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$Address>
    implements _$$AddressCopyWith<$Res> {
  __$$AddressCopyWithImpl(_$Address _value, $Res Function(_$Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$Address(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Address implements Address {
  const _$Address({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'CheckoutEvent.address(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Address &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressCopyWith<_$Address> get copyWith =>
      __$$AddressCopyWithImpl<_$Address>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) address,
    required TResult Function(bool isEditable) editContactNumber,
    required TResult Function(int index) selectedAddress,
    required TResult Function(bool isLoading) loading,
  }) {
    return address(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? address,
    TResult? Function(bool isEditable)? editContactNumber,
    TResult? Function(int index)? selectedAddress,
    TResult? Function(bool isLoading)? loading,
  }) {
    return address?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? address,
    TResult Function(bool isEditable)? editContactNumber,
    TResult Function(int index)? selectedAddress,
    TResult Function(bool isLoading)? loading,
    required TResult orElse(),
  }) {
    if (address != null) {
      return address(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Address value) address,
    required TResult Function(EditContactNumber value) editContactNumber,
    required TResult Function(SelectedAddress value) selectedAddress,
    required TResult Function(Loading value) loading,
  }) {
    return address(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Address value)? address,
    TResult? Function(EditContactNumber value)? editContactNumber,
    TResult? Function(SelectedAddress value)? selectedAddress,
    TResult? Function(Loading value)? loading,
  }) {
    return address?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Address value)? address,
    TResult Function(EditContactNumber value)? editContactNumber,
    TResult Function(SelectedAddress value)? selectedAddress,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (address != null) {
      return address(this);
    }
    return orElse();
  }
}

abstract class Address implements CheckoutEvent {
  const factory Address({required final int index}) = _$Address;

  int get index;
  @JsonKey(ignore: true)
  _$$AddressCopyWith<_$Address> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditContactNumberCopyWith<$Res> {
  factory _$$EditContactNumberCopyWith(
          _$EditContactNumber value, $Res Function(_$EditContactNumber) then) =
      __$$EditContactNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEditable});
}

/// @nodoc
class __$$EditContactNumberCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$EditContactNumber>
    implements _$$EditContactNumberCopyWith<$Res> {
  __$$EditContactNumberCopyWithImpl(
      _$EditContactNumber _value, $Res Function(_$EditContactNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditable = null,
  }) {
    return _then(_$EditContactNumber(
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditContactNumber implements EditContactNumber {
  const _$EditContactNumber({required this.isEditable});

  @override
  final bool isEditable;

  @override
  String toString() {
    return 'CheckoutEvent.editContactNumber(isEditable: $isEditable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditContactNumber &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEditable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditContactNumberCopyWith<_$EditContactNumber> get copyWith =>
      __$$EditContactNumberCopyWithImpl<_$EditContactNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) address,
    required TResult Function(bool isEditable) editContactNumber,
    required TResult Function(int index) selectedAddress,
    required TResult Function(bool isLoading) loading,
  }) {
    return editContactNumber(isEditable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? address,
    TResult? Function(bool isEditable)? editContactNumber,
    TResult? Function(int index)? selectedAddress,
    TResult? Function(bool isLoading)? loading,
  }) {
    return editContactNumber?.call(isEditable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? address,
    TResult Function(bool isEditable)? editContactNumber,
    TResult Function(int index)? selectedAddress,
    TResult Function(bool isLoading)? loading,
    required TResult orElse(),
  }) {
    if (editContactNumber != null) {
      return editContactNumber(isEditable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Address value) address,
    required TResult Function(EditContactNumber value) editContactNumber,
    required TResult Function(SelectedAddress value) selectedAddress,
    required TResult Function(Loading value) loading,
  }) {
    return editContactNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Address value)? address,
    TResult? Function(EditContactNumber value)? editContactNumber,
    TResult? Function(SelectedAddress value)? selectedAddress,
    TResult? Function(Loading value)? loading,
  }) {
    return editContactNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Address value)? address,
    TResult Function(EditContactNumber value)? editContactNumber,
    TResult Function(SelectedAddress value)? selectedAddress,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (editContactNumber != null) {
      return editContactNumber(this);
    }
    return orElse();
  }
}

abstract class EditContactNumber implements CheckoutEvent {
  const factory EditContactNumber({required final bool isEditable}) =
      _$EditContactNumber;

  bool get isEditable;
  @JsonKey(ignore: true)
  _$$EditContactNumberCopyWith<_$EditContactNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedAddressCopyWith<$Res> {
  factory _$$SelectedAddressCopyWith(
          _$SelectedAddress value, $Res Function(_$SelectedAddress) then) =
      __$$SelectedAddressCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectedAddressCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectedAddress>
    implements _$$SelectedAddressCopyWith<$Res> {
  __$$SelectedAddressCopyWithImpl(
      _$SelectedAddress _value, $Res Function(_$SelectedAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectedAddress(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectedAddress implements SelectedAddress {
  const _$SelectedAddress({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'CheckoutEvent.selectedAddress(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedAddress &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedAddressCopyWith<_$SelectedAddress> get copyWith =>
      __$$SelectedAddressCopyWithImpl<_$SelectedAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) address,
    required TResult Function(bool isEditable) editContactNumber,
    required TResult Function(int index) selectedAddress,
    required TResult Function(bool isLoading) loading,
  }) {
    return selectedAddress(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? address,
    TResult? Function(bool isEditable)? editContactNumber,
    TResult? Function(int index)? selectedAddress,
    TResult? Function(bool isLoading)? loading,
  }) {
    return selectedAddress?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? address,
    TResult Function(bool isEditable)? editContactNumber,
    TResult Function(int index)? selectedAddress,
    TResult Function(bool isLoading)? loading,
    required TResult orElse(),
  }) {
    if (selectedAddress != null) {
      return selectedAddress(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Address value) address,
    required TResult Function(EditContactNumber value) editContactNumber,
    required TResult Function(SelectedAddress value) selectedAddress,
    required TResult Function(Loading value) loading,
  }) {
    return selectedAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Address value)? address,
    TResult? Function(EditContactNumber value)? editContactNumber,
    TResult? Function(SelectedAddress value)? selectedAddress,
    TResult? Function(Loading value)? loading,
  }) {
    return selectedAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Address value)? address,
    TResult Function(EditContactNumber value)? editContactNumber,
    TResult Function(SelectedAddress value)? selectedAddress,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (selectedAddress != null) {
      return selectedAddress(this);
    }
    return orElse();
  }
}

abstract class SelectedAddress implements CheckoutEvent {
  const factory SelectedAddress({required final int index}) = _$SelectedAddress;

  int get index;
  @JsonKey(ignore: true)
  _$$SelectedAddressCopyWith<_$SelectedAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$Loading(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CheckoutEvent.loading(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) address,
    required TResult Function(bool isEditable) editContactNumber,
    required TResult Function(int index) selectedAddress,
    required TResult Function(bool isLoading) loading,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? address,
    TResult? Function(bool isEditable)? editContactNumber,
    TResult? Function(int index)? selectedAddress,
    TResult? Function(bool isLoading)? loading,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? address,
    TResult Function(bool isEditable)? editContactNumber,
    TResult Function(int index)? selectedAddress,
    TResult Function(bool isLoading)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Address value) address,
    required TResult Function(EditContactNumber value) editContactNumber,
    required TResult Function(SelectedAddress value) selectedAddress,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Address value)? address,
    TResult? Function(EditContactNumber value)? editContactNumber,
    TResult? Function(SelectedAddress value)? selectedAddress,
    TResult? Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Address value)? address,
    TResult Function(EditContactNumber value)? editContactNumber,
    TResult Function(SelectedAddress value)? selectedAddress,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CheckoutEvent {
  const factory Loading({required final bool isLoading}) = _$Loading;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  QuerySnapshot<Object?>? get addressList => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  bool get isEditable => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, dynamic> get selectedAddress =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {QuerySnapshot<Object?>? addressList,
      String? userEmail,
      bool isEditable,
      bool isLoading,
      Map<String, dynamic> selectedAddress});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = freezed,
    Object? userEmail = freezed,
    Object? isEditable = null,
    Object? isLoading = null,
    Object? selectedAddress = null,
  }) {
    return _then(_value.copyWith(
      addressList: freezed == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAddress: null == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuerySnapshot<Object?>? addressList,
      String? userEmail,
      bool isEditable,
      bool isLoading,
      Map<String, dynamic> selectedAddress});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = freezed,
    Object? userEmail = freezed,
    Object? isEditable = null,
    Object? isLoading = null,
    Object? selectedAddress = null,
  }) {
    return _then(_$_Initial(
      addressList: freezed == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAddress: null == selectedAddress
          ? _value._selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.addressList,
      required this.userEmail,
      required this.isEditable,
      required this.isLoading,
      required final Map<String, dynamic> selectedAddress})
      : _selectedAddress = selectedAddress;

  @override
  final QuerySnapshot<Object?>? addressList;
  @override
  final String? userEmail;
  @override
  final bool isEditable;
  @override
  final bool isLoading;
  final Map<String, dynamic> _selectedAddress;
  @override
  Map<String, dynamic> get selectedAddress {
    if (_selectedAddress is EqualUnmodifiableMapView) return _selectedAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedAddress);
  }

  @override
  String toString() {
    return 'CheckoutState(addressList: $addressList, userEmail: $userEmail, isEditable: $isEditable, isLoading: $isLoading, selectedAddress: $selectedAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.addressList, addressList) ||
                other.addressList == addressList) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._selectedAddress, _selectedAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      addressList,
      userEmail,
      isEditable,
      isLoading,
      const DeepCollectionEquality().hash(_selectedAddress));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CheckoutState {
  const factory _Initial(
      {required final QuerySnapshot<Object?>? addressList,
      required final String? userEmail,
      required final bool isEditable,
      required final bool isLoading,
      required final Map<String, dynamic> selectedAddress}) = _$_Initial;

  @override
  QuerySnapshot<Object?>? get addressList;
  @override
  String? get userEmail;
  @override
  bool get isEditable;
  @override
  bool get isLoading;
  @override
  Map<String, dynamic> get selectedAddress;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
