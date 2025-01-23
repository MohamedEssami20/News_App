import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewCubit extends Cubit<int> {
  late TabController tabController;

  HomeViewCubit(SingleTickerProviderStateMixin vsync) : super(0) {
    tabController = TabController(length: 8, vsync: vsync);
    tabController.addListener(() {
      emit(tabController.index);
    });
  }
  void changeIndex(int index) {
    emit(index);
  }
}
