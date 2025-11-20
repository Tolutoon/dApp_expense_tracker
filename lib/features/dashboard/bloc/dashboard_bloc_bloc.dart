import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dapp_expense_tracker/models/transaction_model.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

part 'dashboard_bloc_event.dart';
part 'dashboard_bloc_state.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBlocBloc() : super(DashboardBlocInitial()) {
    on<DashboardInitialFetchEvent>(dashboardInitialFetchEvent);
  }

  List<TransactionModel> transactions = [];
  Web3Client? _web3Client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;

  //functions
  late DeployedContract _deployedContract;
  late ContractFunction _deposit;
  late ContractFunction _withdraw;
  late ContractFunction _getBalance;
  late ContractFunction _getAllTransactions;

  Future<void> dashboardInitialFetchEvent(DashboardInitialFetchEvent event,
      Emitter<DashboardBlocState> emit) async {
    emit(DashboardLoadingState());

    try {
      final String rpcUrl = "http://127.0.0.1:7545";
      final String socketUrl = "ws://127.0.0.1:7545";
      final String privateKey =
          "0xf80e51f6b2a4072e564376f9b62638b04b89dd3ca5e42abdad5e6d7eaca965c9";

      _web3Client = Web3Client(rpcUrl, http.Client(), socketConnector: () {
        return IOWebSocketChannel.connect(socketUrl).cast<String>();
      });

//getABI
      String abiFile = await rootBundle
          .loadString('build/contracts/ExpenseManagerContract.json');
      var jsonDecoded = jsonDecode(abiFile);
      _abiCode = ContractAbi.fromJson(
          jsonDecode(jsonDecoded['abi']), 'ExpenseManagerContract');

      //get contract address
      _contractAddress =
          EthereumAddress.fromHex("0xB4Fcc42909BE396763760F32A042A81E8632178f");

      _creds = EthPrivateKey.fromHex(privateKey);

      //get deployed contract
      _deployedContract = DeployedContract(_abiCode, _contractAddress);

      _deposit = _deployedContract.function("deposit");
      _withdraw = _deployedContract.function("withdraw");
      _getBalance = _deployedContract.function("getBalance");
      _getAllTransactions = _deployedContract.function("getTransactions");

      final data = await _web3Client!.call(
          contract: _deployedContract,
          function: _getAllTransactions,
          params: []);
      log(data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
