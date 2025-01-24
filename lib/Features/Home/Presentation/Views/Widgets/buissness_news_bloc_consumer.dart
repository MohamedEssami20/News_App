import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Bussiness_News_Cubit/bussiness_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_buissness_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class BuissnessNewsBlocConsumer extends StatelessWidget {
  const BuissnessNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BussinessNewsCubit, BussinessNewsState>(
      builder: (context, state) {
        if (state is BussinessNewsSuccess ||
            state is BussinessNewsPaginationSuccess ||
            state is BussinessNewsPaginationLoading ||
            state is BussinessNewsPaginationfailure) {
          return CustomBuissnessNewsListView(
            newsData: context.read<BussinessNewsCubit>().currentNews,currentIndex: currentIndex,
          );
        } else if (state is BussinessNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
      listener: (context, state) {
        if (state is BussinessNewsPaginationfailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
    );
  }
}
