import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Health_News_Cubit/health_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_health_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class HealthNewsBlocConsumer extends StatefulWidget {
  const HealthNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<HealthNewsBlocConsumer> createState() => _HealthNewsBlocConsumerState();
}

class _HealthNewsBlocConsumerState extends State<HealthNewsBlocConsumer> {
  final List<NewsEntity> newsData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HealthNewsCubit, HealthNewsState>(
      builder: (context, state) {
        if (state is HealthNewsSuccess ||
            state is HealthNewsPaginationSuccess||
            state is HealthNewsPaginationLoading ||
            state is HealthNewsPaginationFailure) {
          return CustomHealthNewsListView(
            newsData: newsData,currentIndex: widget.currentIndex,
          );
        } else if (state is HealthNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
      listener: (context, state) {
         if (state is HealthNewsSuccess) {
            if (state.newsData.isNotEmpty) {
              newsData.clear();
              newsData.addAll(state.newsData);
            }
          } // handel state of refresh or start app;

          if (state is HealthNewsPaginationSuccess) {
            if (state.newsData.isNotEmpty) {
              newsData.addAll(state.newsData);
            }
          } // handel pagination news data;


        if (state is HealthNewsPaginationFailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
    );
  }
}
