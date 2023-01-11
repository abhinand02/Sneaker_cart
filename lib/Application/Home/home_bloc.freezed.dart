// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) userDetails,
    required TResult Function(String searchKey) searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? userDetails,
    TResult? Function(String searchKey)? searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? userDetails,
    TResult Function(String searchKey)? searchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserDetails value) userDetails,
    required TResult Function(searchResult value) searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserDetails value)? userDetails,
    TResult? Function(searchResult value)? searchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserDetails value)? userDetails,
    TResult Function(searchResult value)? searchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) userDetails,
    required TResult Function(String searchKey) searchResult,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? userDetails,
    TResult? Function(String searchKey)? searchResult,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? userDetails,
    TResult Function(String searchKey)? searchResult,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserDetails value) userDetails,
    required TResult Function(searchResult value) searchResult,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserDetails value)? userDetails,
    TResult? Function(searchResult value)? searchResult,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserDetails value)? userDetails,
    TResult Function(searchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsCopyWith(
          _$UserDetails value, $Res Function(_$UserDetails) then) =
      __$$UserDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$UserDetailsCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UserDetails>
    implements _$$UserDetailsCopyWith<$Res> {
  __$$UserDetailsCopyWithImpl(
      _$UserDetails _value, $Res Function(_$UserDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$UserDetails(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserDetails implements UserDetails {
  const _$UserDetails({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'HomeEvent.userDetails(newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetails &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsCopyWith<_$UserDetails> get copyWith =>
      __$$UserDetailsCopyWithImpl<_$UserDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) userDetails,
    required TResult Function(String searchKey) searchResult,
  }) {
    return userDetails(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? userDetails,
    TResult? Function(String searchKey)? searchResult,
  }) {
    return userDetails?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? userDetails,
    TResult Function(String searchKey)? searchResult,
    required TResult orElse(),
  }) {
    if (userDetails != null) {
      return userDetails(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserDetails value) userDetails,
    required TResult Function(searchResult value) searchResult,
  }) {
    return userDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserDetails value)? userDetails,
    TResult? Function(searchResult value)? searchResult,
  }) {
    return userDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserDetails value)? userDetails,
    TResult Function(searchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (userDetails != null) {
      return userDetails(this);
    }
    return orElse();
  }
}

abstract class UserDetails implements HomeEvent {
  const factory UserDetails({required final bool newValue}) = _$UserDetails;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$UserDetailsCopyWith<_$UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$searchResultCopyWith<$Res> {
  factory _$$searchResultCopyWith(
          _$searchResult value, $Res Function(_$searchResult) then) =
      __$$searchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$searchResultCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$searchResult>
    implements _$$searchResultCopyWith<$Res> {
  __$$searchResultCopyWithImpl(
      _$searchResult _value, $Res Function(_$searchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$searchResult(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$searchResult implements searchResult {
  const _$searchResult({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'HomeEvent.searchResult(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$searchResult &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$searchResultCopyWith<_$searchResult> get copyWith =>
      __$$searchResultCopyWithImpl<_$searchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) userDetails,
    required TResult Function(String searchKey) searchResult,
  }) {
    return searchResult(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? userDetails,
    TResult? Function(String searchKey)? searchResult,
  }) {
    return searchResult?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? userDetails,
    TResult Function(String searchKey)? searchResult,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserDetails value) userDetails,
    required TResult Function(searchResult value) searchResult,
  }) {
    return searchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserDetails value)? userDetails,
    TResult? Function(searchResult value)? searchResult,
  }) {
    return searchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserDetails value)? userDetails,
    TResult Function(searchResult value)? searchResult,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(this);
    }
    return orElse();
  }
}

abstract class searchResult implements HomeEvent {
  const factory searchResult({required final String searchKey}) =
      _$searchResult;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$searchResultCopyWith<_$searchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  QuerySnapshot<Object?>? get productList => throw _privateConstructorUsedError;
  QuerySnapshot<Object?>? get newArrival => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get userDetails =>
      throw _privateConstructorUsedError;
  QuerySnapshot<Object?>? get searchResult =>
      throw _privateConstructorUsedError;
  bool get isReadOnly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {QuerySnapshot<Object?>? productList,
      QuerySnapshot<Object?>? newArrival,
      DocumentSnapshot<Object?>? userDetails,
      QuerySnapshot<Object?>? searchResult,
      bool isReadOnly});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = freezed,
    Object? newArrival = freezed,
    Object? userDetails = freezed,
    Object? searchResult = freezed,
    Object? isReadOnly = null,
  }) {
    return _then(_value.copyWith(
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      newArrival: freezed == newArrival
          ? _value.newArrival
          : newArrival // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      searchResult: freezed == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      isReadOnly: null == isReadOnly
          ? _value.isReadOnly
          : isReadOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuerySnapshot<Object?>? productList,
      QuerySnapshot<Object?>? newArrival,
      DocumentSnapshot<Object?>? userDetails,
      QuerySnapshot<Object?>? searchResult,
      bool isReadOnly});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = freezed,
    Object? newArrival = freezed,
    Object? userDetails = freezed,
    Object? searchResult = freezed,
    Object? isReadOnly = null,
  }) {
    return _then(_$_Initial(
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      newArrival: freezed == newArrival
          ? _value.newArrival
          : newArrival // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      searchResult: freezed == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as QuerySnapshot<Object?>?,
      isReadOnly: null == isReadOnly
          ? _value.isReadOnly
          : isReadOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.productList,
      required this.newArrival,
      required this.userDetails,
      required this.searchResult,
      required this.isReadOnly});

  @override
  final QuerySnapshot<Object?>? productList;
  @override
  final QuerySnapshot<Object?>? newArrival;
  @override
  final DocumentSnapshot<Object?>? userDetails;
  @override
  final QuerySnapshot<Object?>? searchResult;
  @override
  final bool isReadOnly;

  @override
  String toString() {
    return 'HomeState(productList: $productList, newArrival: $newArrival, userDetails: $userDetails, searchResult: $searchResult, isReadOnly: $isReadOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.productList, productList) ||
                other.productList == productList) &&
            (identical(other.newArrival, newArrival) ||
                other.newArrival == newArrival) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.searchResult, searchResult) ||
                other.searchResult == searchResult) &&
            (identical(other.isReadOnly, isReadOnly) ||
                other.isReadOnly == isReadOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productList, newArrival,
      userDetails, searchResult, isReadOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final QuerySnapshot<Object?>? productList,
      required final QuerySnapshot<Object?>? newArrival,
      required final DocumentSnapshot<Object?>? userDetails,
      required final QuerySnapshot<Object?>? searchResult,
      required final bool isReadOnly}) = _$_Initial;

  @override
  QuerySnapshot<Object?>? get productList;
  @override
  QuerySnapshot<Object?>? get newArrival;
  @override
  DocumentSnapshot<Object?>? get userDetails;
  @override
  QuerySnapshot<Object?>? get searchResult;
  @override
  bool get isReadOnly;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
