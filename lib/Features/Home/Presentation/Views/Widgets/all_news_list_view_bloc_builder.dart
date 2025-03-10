import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/All_News_Cubit/all_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_all_news_item_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class AllNewsListViewBlocBuilder extends StatelessWidget {
  const AllNewsListViewBlocBuilder({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConncetionCubit, InternetConncetionState>(
      listener: (context, state) {
        if (state is InternetConncetionFailure) {
          showErrorSnackbar(context, "No Internet Connection", Icons.wifi_off);
        } else if (state is InternetConncetionSuccess) {
          showErrorSnackbar(
              context, "You are connected the internet", Icons.wifi);
        }
      },
      child: BlocConsumer<AllNewsCubit, AllNewsState>(
        listener: (context, state) {
          if (state is AllNewsPaginationFailure) {
            showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
          }
        },
        builder: (context, state) {
          if (state is AllNewsSuccess ||
              state is AllNewsPaginationSuccess ||
              state is AllNewsPaginationFailure ||
              state is AllNewsPaginationLoading) {
            return CustomAllNewsListView(
                newsData: context.read<AllNewsCubit>().currentNews,
                currentIndex: currentIndex);
          } else if (state is AllNewsFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return const NewsListViewIndicator();
          }
        },
      ),
    );
  }
}
