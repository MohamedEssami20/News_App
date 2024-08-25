import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Sports_News_Cubit/sports_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_sports_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class SportsNewsBlocConsumer extends StatefulWidget {
  const SportsNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<SportsNewsBlocConsumer> createState() => _SportsNewsBlocConsumerState();
}

class _SportsNewsBlocConsumerState extends State<SportsNewsBlocConsumer> {
  final List<NewsEntity> newsData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportsNewsCubit, SportsNewsState>(
      listener: (context, state) {
        if (state is SportsNewsSuccess) {
          if (state.newsData.isNotEmpty) {
            newsData.clear();
            newsData.addAll(state.newsData);
          }
        } // handel state of refresh or start app;

        if (state is SportsNewsPaginationSuccess) {
          if (state.newsData.isNotEmpty) {
            newsData.addAll(state.newsData);
          }
        } // handel pagination news data;

        if (state is SportsNewsPaginationFailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
      builder: (context, state) {
        if (state is SportsNewsSuccess ||
            state is SportsNewsPaginationSuccess ||
            state is SportsNewsPaginationLoading ||
            state is SportsNewsPaginationFailure) {
          return CustomSportsNewsListView(
            newsData: newsData, currentIndex: widget.currentIndex,
          );
        } else if (state is SportsNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
    );
  }
}
