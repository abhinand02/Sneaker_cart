// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lazy_loading_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LazyLoadingEvent {
  bool get loadingValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadingValue) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadingValue)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadingValue)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LazyLoadingEventCopyWith<LazyLoadingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LazyLoadingEventCopyWith<$Res> {
  factory $LazyLoadingEventCopyWith(
          LazyLoadingEvent value, $Res Function(LazyLoadingEvent) then) =
      _$LazyLoadingEventCopyWithImpl<$Res, LazyLoadingEvent>;
  @useResult
  $Res call({bool loadingValue});
}

/// @nodoc
class _$LazyLoadingEventCopyWithImpl<$Res, $Val extends LazyLoadingEvent>
    implements $LazyLoadingEventCopyWith<$Res> {
  _$LazyLoadingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingValue = null,
  }) {
    return _then(_value.copyWith(
      loadingValue: null == loadingValue
          ? _value.loadingValue
          : loadingValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$startedCopyWith<$Res>
    implements $LazyLoadingEventCopyWith<$Res> {
  factory _$$startedCopyWith(_$started value, $Res Function(_$started) then) =
      __$$startedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loadingValue});
}

/// @nodoc
class __$$startedCopyWithImpl<$Res>
    extends _$LazyLoadingEventCopyWithImpl<$Res, _$started>
    implements _$$startedCopyWith<$Res> {
  __$$startedCopyWithImpl(_$started _value, $Res Function(_$started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingValue = null,
  }) {
    return _then(_$started(
      loadingValue: null == loadingValue
          ? _value.loadingValue
          : loadingValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$started implements started {
  const _$started({required this.loadingValue});

  @override
  final bool loadingValue;

  @override
  String toString() {
    return 'LazyLoadingEvent.started(loadingValue: $loadingValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$started &&
            (identical(other.loadingValue, loadingValue) ||
                other.loadingValue == loadingValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$startedCopyWith<_$started> get copyWith =>
      __$$startedCopyWithImpl<_$started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadingValue) started,
  }) {
    return started(loadingValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadingValue)? started,
  }) {
    return started?.call(loadingValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadingValue)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(loadingValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class started implements LazyLoadingEvent {
  const factory started({required final bool loadingValue}) = _$started;

  @override
  bool get loadingValue;
  @override
  @JsonKey(ignore: true)
  _$$startedCopyWith<_$started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LazyLoadingState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LazyLoadingStateCopyWith<LazyLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LazyLoadingStateCopyWith<$Res> {
  factory $LazyLoadingStateCopyWith(
          LazyLoadingState value, $Res Function(LazyLoadingState) then) =
      _$LazyLoadingStateCopyWithImpl<$Res, LazyLoadingState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$LazyLoadingStateCopyWithImpl<$Res, $Val extends LazyLoadingState>
    implements $LazyLoadingStateCopyWith<$Res> {
  _$LazyLoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $LazyLoadingStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LazyLoadingStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'LazyLoadingState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements LazyLoadingState {
  const factory _Initial({required final bool isLoading}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
