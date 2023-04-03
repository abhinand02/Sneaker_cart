// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrdersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrderHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrderHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrderHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrderHistory value) getOrderHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrderHistory value)? getOrderHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrderHistory value)? getOrderHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
          OrdersEvent value, $Res Function(OrdersEvent) then) =
      _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetOrderHistoryCopyWith<$Res> {
  factory _$$GetOrderHistoryCopyWith(
          _$GetOrderHistory value, $Res Function(_$GetOrderHistory) then) =
      __$$GetOrderHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOrderHistoryCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrderHistory>
    implements _$$GetOrderHistoryCopyWith<$Res> {
  __$$GetOrderHistoryCopyWithImpl(
      _$GetOrderHistory _value, $Res Function(_$GetOrderHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOrderHistory implements GetOrderHistory {
  const _$GetOrderHistory();

  @override
  String toString() {
    return 'OrdersEvent.getOrderHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOrderHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrderHistory,
  }) {
    return getOrderHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrderHistory,
  }) {
    return getOrderHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrderHistory,
    required TResult orElse(),
  }) {
    if (getOrderHistory != null) {
      return getOrderHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrderHistory value) getOrderHistory,
  }) {
    return getOrderHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrderHistory value)? getOrderHistory,
  }) {
    return getOrderHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrderHistory value)? getOrderHistory,
    required TResult orElse(),
  }) {
    if (getOrderHistory != null) {
      return getOrderHistory(this);
    }
    return orElse();
  }
}

abstract class GetOrderHistory implements OrdersEvent {
  const factory GetOrderHistory() = _$GetOrderHistory;
}

/// @nodoc
mixin _$OrdersState {
  List<QueryDocumentSnapshot<Object?>> get orderHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrdersStateCopyWith<OrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
  @useResult
  $Res call({List<QueryDocumentSnapshot<Object?>> orderHistory});
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistory = null,
  }) {
    return _then(_value.copyWith(
      orderHistory: null == orderHistory
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QueryDocumentSnapshot<Object?>> orderHistory});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistory = null,
  }) {
    return _then(_$_Initial(
      orderHistory: null == orderHistory
          ? _value._orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as List<QueryDocumentSnapshot<Object?>>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<QueryDocumentSnapshot<Object?>> orderHistory})
      : _orderHistory = orderHistory;

  final List<QueryDocumentSnapshot<Object?>> _orderHistory;
  @override
  List<QueryDocumentSnapshot<Object?>> get orderHistory {
    if (_orderHistory is EqualUnmodifiableListView) return _orderHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistory);
  }

  @override
  String toString() {
    return 'OrdersState(orderHistory: $orderHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._orderHistory, _orderHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements OrdersState {
  const factory _Initial(
          {required final List<QueryDocumentSnapshot<Object?>> orderHistory}) =
      _$_Initial;

  @override
  List<QueryDocumentSnapshot<Object?>> get orderHistory;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
