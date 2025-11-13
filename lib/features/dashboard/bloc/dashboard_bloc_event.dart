part of 'dashboard_bloc_bloc.dart';

@immutable
sealed class DashboardBlocEvent {}

class DashboardInitialFetchEvent extends DashboardBlocEvent {}
