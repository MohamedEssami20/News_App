import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_conncetion_state.dart';

class InternetConncetionCubit extends Cubit<InternetConncetionState> {
  InternetConncetionCubit(this._connectivity)
      : super(InternetConncetionInitial());

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;
  void checkInternetConnection() {
    connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      log("Internet Connection cubit= $result");
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        emit(
          InternetConncetionSuccess(connected: result),
        );
      } else if (result.contains(ConnectivityResult.none)) {
        emit(InternetConncetionFailure());
      }
    });
  }
 
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
