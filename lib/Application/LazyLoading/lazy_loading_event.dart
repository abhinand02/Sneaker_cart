part of 'lazy_loading_bloc.dart';

@freezed
class LazyLoadingEvent with _$LazyLoadingEvent {
  const factory LazyLoadingEvent.started({
    required bool loadingValue,
  }) = started;
}