import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Sports_News_Cubit/sports_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_sports_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class SportsNewsBlocConsumer extends StatelessWidget {
  const SportsNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportsNewsCubit, SportsNewsState>(
      listener: (context, state) {
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
            newsData: context.read<SportsNewsCubit>().currentNews, currentIndex: currentIndex,
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
