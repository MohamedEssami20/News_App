import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_item_animation.dart';

class CustomNewsListViewAnimation extends StatelessWidget {
  const CustomNewsListViewAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const CustomNewsItemAnimation();
      },
    );
  }
}