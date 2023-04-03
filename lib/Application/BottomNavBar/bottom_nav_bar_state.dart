part of 'bottom_nav_bar_bloc.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState({
  required  int selectedIndex,
  }) = _Initial;

  factory BottomNavBarState.initial(){
    return const BottomNavBarState(selectedIndex: 0);
  }
}
