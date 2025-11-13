import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBlocBloc() : super(DashboardBlocInitial()) {
    on<DashboardInitialFetchEvent>(dashboardInitialFetchEvent);
  }
}

FutureOr<void> dashboardInitialFetchEvent(
    DashboardInitialFetchEvent event, Emitter<DashboardBlocState> emit) {
  emit(DashboardLoadingState());
}
