import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Science_News_Cubit.dart/science_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_science_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class ScienceNewsBlocConsumer extends StatefulWidget {
  const ScienceNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<ScienceNewsBlocConsumer> createState() =>
      _ScienceNewsBlocConsumerState();
}

class _ScienceNewsBlocConsumerState extends State<ScienceNewsBlocConsumer> {
  final List<NewsEntity> newsData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScienceNewsCubit, ScienceNewsState>(
      builder: (context, state) {
        if (state is ScienceNewsSuccess ||
            state is ScienceNewsPaginationSuccess ||
            state is ScienceNewsPaginationLoading ||
            state is ScienceNewsPaginationFailure) {
          return CustomScienceNewsListView(
            newsData: newsData,currentIndex: widget.currentIndex,
          );
        } else if (state is ScienceNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
      listener: (context, state) {
        if (state is ScienceNewsSuccess) {
          if (state.newsData.isNotEmpty) {
            newsData.clear();
            newsData.addAll(state.newsData);
          }
        } // handel state of refresh or start app;

        if (state is ScienceNewsPaginationSuccess) {
          if (state.newsData.isNotEmpty) {
            newsData.addAll(state.newsData);
          }
        } // handel pagination news data;

        if (state is ScienceNewsPaginationFailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
    );
  }
}
