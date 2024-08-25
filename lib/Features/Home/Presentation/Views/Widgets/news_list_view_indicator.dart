import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/Widgets/custom_fading_widegt.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/news_list_view_animation.dart';

class NewsListViewIndicator extends StatelessWidget {
  const NewsListViewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadingWidget(
      child: NewsListViewAnimation(),
    );
  }
}
