import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Poltics_News_Cubit/poltics_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_poltics_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class PolticsNewsBlocConsumer extends StatelessWidget {
  const PolticsNewsBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PolticsCubit, PolticsNewsState>(
      listener: (context, state) {
        if (state is PolticsNewsPaginationFailure) {
          showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
        }
      },
      builder: (context, state) {
        if (state is PolticsNewsSuccess ||
            state is PolticsNewsPaginationSuccess ||
            state is PolticsNewsPaginationLoading ||
            state is PolticsNewsPaginationFailure) {
          return CustomPolticsNewsListView(
            newsData: context.read<PolticsCubit>().currentNews,
            currentIndex: currentIndex,
          );
        } else if (state is PolticsNewsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const NewsListViewIndicator();
        }
      },
    );
  }
}
