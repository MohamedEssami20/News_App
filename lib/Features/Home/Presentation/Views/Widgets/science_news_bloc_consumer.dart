import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Science_News_Cubit.dart/science_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_science_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class ScienceNewsBlocConsumer extends StatelessWidget {
  const ScienceNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScienceNewsCubit, ScienceNewsState>(
      builder: (context, state) {
        if (state is ScienceNewsSuccess ||
            state is ScienceNewsPaginationSuccess ||
            state is ScienceNewsPaginationLoading ||
            state is ScienceNewsPaginationFailure) {
          return CustomScienceNewsListView(
            newsData: context.read<ScienceNewsCubit>().currentNews,currentIndex: currentIndex,
          );
        } else if (state is ScienceNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
      listener: (context, state) {

        if (state is ScienceNewsPaginationFailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
    );
  }
}
