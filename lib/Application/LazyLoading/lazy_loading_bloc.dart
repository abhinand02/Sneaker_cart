import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lazy_loading_event.dart';
part 'lazy_loading_state.dart';
part 'lazy_loading_bloc.freezed.dart';

class LazyLoadingBloc extends Bloc<LazyLoadingEvent, LazyLoadingState> {
  LazyLoadingBloc() : super(LazyLoadingState.initial()) {
    on<started>((event, emit) {
      emit(LazyLoadingState(isLoading: event.loadingValue),);
    });
  }
}
