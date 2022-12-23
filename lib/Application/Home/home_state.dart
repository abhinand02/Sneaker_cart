part of 'home_bloc.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required QuerySnapshot<Object?>? productList,
    required QuerySnapshot<Object?>? newArrival,
  }) = _Initial;

  factory HomeState.initial() {
    
    return const HomeState(productList: null, newArrival: null);
  }
}

