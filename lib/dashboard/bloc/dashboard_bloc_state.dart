part of 'dashboard_bloc_bloc.dart';

@immutable
sealed class DashboardBlocState {}

final class DashboardBlocInitial extends DashboardBlocState {}

class DashboardLoadingState extends DashboardBlocState{}

class DashboardErrorState extends DashboardBlocState{}

class DashboardSuccessState extends DashboardBlocState{}