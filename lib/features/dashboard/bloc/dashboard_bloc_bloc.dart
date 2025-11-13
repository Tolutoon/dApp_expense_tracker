import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dapp_expense_tracker/models/transaction_model.dart';
import 'package:meta/meta.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBlocBloc() : super(DashboardBlocInitial()) {
    on<DashboardInitialFetchEvent>(dashboardInitialFetchEvent);
  }
}

List<TransactionModel> transactions = [];
Web3Client? _web3Client;

FutureOr<void> dashboardInitialFetchEvent(
    DashboardInitialFetchEvent event, Emitter<DashboardBlocState> emit) {
  emit(DashboardLoadingState());

  final String rpcUrl = "http://127.0.0.1:7545";
  final String socketUrl = "ws://127.0.0.1:7545";
  final String privateKey =
      "0xf80e51f6b2a4072e564376f9b62638b04b89dd3ca5e42abdad5e6d7eaca965c9";

  _web3Client = Web3Client(rpcUrl, http.Client(), socketConnector: (){
    return IOwe
  });
}
