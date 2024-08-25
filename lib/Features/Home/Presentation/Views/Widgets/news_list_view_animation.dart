import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_list_view_animation.dart';

class NewsListViewAnimation extends StatelessWidget {
  const NewsListViewAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(left: 30, top: 30),
      child: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(
              child: SizedBox()),
           SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
           SliverFillRemaining(child: CustomNewsListViewAnimation()),
        ],
      ),
    );
  }
}