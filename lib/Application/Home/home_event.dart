part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.userDetails({required bool newValue}) = UserDetails;

  const factory HomeEvent.searchResult({required String searchKey}) = searchResult;
  
}