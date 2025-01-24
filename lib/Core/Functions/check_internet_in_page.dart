import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';

checkInternetatLastOfNewsList(
    {required double currentIndex,
    required double maxScroll,
    required BuildContext context,}) {
  bool isLoading = false;
  final internetConnection = context.read<InternetConncetionCubit>().state;
  if (maxScroll == currentIndex) {
    if (!isLoading) {
      isLoading = true;
      if (isLoading == true &&
          internetConnection is InternetConncetionFailure) {
        log("Is loading in 2= $isLoading");
        showErrorSnackbar(
            context, "Enternet connection error, try later", Icons.wifi_off);
        isLoading = false;
        log("Is loading in 3= $isLoading");
      }
    }
  }
}
