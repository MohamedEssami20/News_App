
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Technology_news_Cubit/technology_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_technology_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class TechnologyNewsBlocConsumer extends StatelessWidget {
  const TechnologyNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TechnologyNewsCubit, TechnologyNewsState>(
        builder: (context, state) {
      if (state is TechnologyNewsSuccess ||
          state is TechnologyNewsPaginationSuccess||
          state is TechnologyNewsPaginationLoading ||
          state is TechnologyNewsPaginationFailure) {
        return CustomTechnologyListView(
          newsData: context.read<TechnologyNewsCubit>().currentNews,currentIndex: currentIndex,
        );
      } else if (state is TechnologyNewsFailure) {
        return CustomErrorWidget(errorMessage: state.errorMessage);
      } else {
        return const NewsListViewIndicator();
      }
    },  listener: (context, state) {

          if (state is TechnologyNewsPaginationFailure) {
            showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
          }
        },);
  }
}
