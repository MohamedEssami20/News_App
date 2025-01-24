import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/Widgets/custom_error_widget.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Enternainment_News_Cubit/enternainment_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_enternainment_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_indicator.dart';

class EnternaimentBlocConsumer extends StatelessWidget {
  const EnternaimentBlocConsumer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EnternainmentNewsCubit, EnternainmentNewsState>(
        builder: (context, state) {
      if (state is EnternainmentNewsSuccess ||
          state is EnternainmentNewsSuccess||
          state is EnternainmentNewsPaginationLoading ||
          state is EnternainmentNewsPaginationFailure) {
        return CustomEnternainmentListView(newsData: context.read<EnternainmentNewsCubit>().currentNews,currentIndex: currentIndex,);
      } else if (state is EnternainmentNewsFailure) {
        return CustomErrorWidget(errorMessage: state.errorMessage);
      } else {
        return const NewsListViewIndicator();
      }
    },  listener: (context, state) {

          if (state is EnternainmentNewsPaginationFailure) {
            showErrorSnackbar(context, state.errorMessage, Icons.wifi_off);
          }
        },);
  }
}
