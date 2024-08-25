import 'package:flutter/material.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/Poltics_news_bloc_consumer.dart';

class PolticsNewsListView extends StatelessWidget {
  const PolticsNewsListView({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Text(
            "Poltics News",
            style: AppStyle.semiBold20(context),
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
           SliverFillRemaining(child: PolticsNewsBlocConsumer(currentIndex: currentIndex,)),
        ],
      ),
    );
  }
}
