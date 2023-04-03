part of 'bottom_nav_bar_bloc.dart';

@freezed
class BottomNavBarEvent with _$BottomNavBarEvent {
  const factory BottomNavBarEvent.updateIndex({
    required int  newIndex,
  }) = UpdateIndex;
}