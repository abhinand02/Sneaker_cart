// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomNavBarEvent {
  int get newIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int newIndex) updateIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int newIndex)? updateIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int newIndex)? updateIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateIndex value) updateIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateIndex value)? updateIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateIndex value)? updateIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavBarEventCopyWith<BottomNavBarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavBarEventCopyWith<$Res> {
  factory $BottomNavBarEventCopyWith(
          BottomNavBarEvent value, $Res Function(BottomNavBarEvent) then) =
      _$BottomNavBarEventCopyWithImpl<$Res, BottomNavBarEvent>;
  @useResult
  $Res call({int newIndex});
}

/// @nodoc
class _$BottomNavBarEventCopyWithImpl<$Res, $Val extends BottomNavBarEvent>
    implements $BottomNavBarEventCopyWith<$Res> {
  _$BottomNavBarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newIndex = null,
  }) {
    return _then(_value.copyWith(
      newIndex: null == newIndex
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateIndexCopyWith<$Res>
    implements $BottomNavBarEventCopyWith<$Res> {
  factory _$$UpdateIndexCopyWith(
          _$UpdateIndex value, $Res Function(_$UpdateIndex) then) =
      __$$UpdateIndexCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int newIndex});
}

/// @nodoc
class __$$UpdateIndexCopyWithImpl<$Res>
    extends _$BottomNavBarEventCopyWithImpl<$Res, _$UpdateIndex>
    implements _$$UpdateIndexCopyWith<$Res> {
  __$$UpdateIndexCopyWithImpl(
      _$UpdateIndex _value, $Res Function(_$UpdateIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newIndex = null,
  }) {
    return _then(_$UpdateIndex(
      newIndex: null == newIndex
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateIndex implements UpdateIndex {
  const _$UpdateIndex({required this.newIndex});

  @override
  final int newIndex;

  @override
  String toString() {
    return 'BottomNavBarEvent.updateIndex(newIndex: $newIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIndex &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIndexCopyWith<_$UpdateIndex> get copyWith =>
      __$$UpdateIndexCopyWithImpl<_$UpdateIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int newIndex) updateIndex,
  }) {
    return updateIndex(newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int newIndex)? updateIndex,
  }) {
    return updateIndex?.call(newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int newIndex)? updateIndex,
    required TResult orElse(),
  }) {
    if (updateIndex != null) {
      return updateIndex(newIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateIndex value) updateIndex,
  }) {
    return updateIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateIndex value)? updateIndex,
  }) {
    return updateIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateIndex value)? updateIndex,
    required TResult orElse(),
  }) {
    if (updateIndex != null) {
      return updateIndex(this);
    }
    return orElse();
  }
}

abstract class UpdateIndex implements BottomNavBarEvent {
  const factory UpdateIndex({required final int newIndex}) = _$UpdateIndex;

  @override
  int get newIndex;
  @override
  @JsonKey(ignore: true)
  _$$UpdateIndexCopyWith<_$UpdateIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomNavBarState {
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavBarStateCopyWith<BottomNavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavBarStateCopyWith<$Res> {
  factory $BottomNavBarStateCopyWith(
          BottomNavBarState value, $Res Function(BottomNavBarState) then) =
      _$BottomNavBarStateCopyWithImpl<$Res, BottomNavBarState>;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$BottomNavBarStateCopyWithImpl<$Res, $Val extends BottomNavBarState>
    implements $BottomNavBarStateCopyWith<$Res> {
  _$BottomNavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $BottomNavBarStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$BottomNavBarStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_$_Initial(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.selectedIndex});

  @override
  final int selectedIndex;

  @override
  String toString() {
    return 'BottomNavBarState(selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements BottomNavBarState {
  const factory _Initial({required final int selectedIndex}) = _$_Initial;

  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
