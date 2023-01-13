part of 'home_bloc.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required QuerySnapshot<Object?>? productList,
    required QuerySnapshot<Object?>? newArrival,
    required DocumentSnapshot<Object?>? userDetails,
    required QuerySnapshot<Object?>? searchResult,
    required bool isReadOnly,
    required bool obscurText,
  }) = _Initial;

  factory HomeState.initial() {
    
    return const HomeState(productList: null, newArrival: null, userDetails: null,isReadOnly: true, searchResult: null, obscurText: true);
  }
}

