part of 'lazy_loading_bloc.dart';

@freezed
class LazyLoadingState with _$LazyLoadingState {
  const factory LazyLoadingState({
    required bool isLoading,
  }) = _Initial;

  factory LazyLoadingState.initial(){
    return const LazyLoadingState(isLoading: false);
  }
}
