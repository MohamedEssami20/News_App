import 'package:flutter/material.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/all_news_list_view_bloc_builder.dart';

class AllNewsListView extends StatelessWidget {
  const AllNewsListView({
    super.key, required this.currrentIndex,
  });
  final int currrentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Text(
            "Today’s news",
            style: AppStyle.semiBold20(context),
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
           SliverFillRemaining(child: AllNewsListViewBlocBuilder(currentIndex: currrentIndex,)),
        ],
      ),
    );
  }
}
