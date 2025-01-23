import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_image_animation.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_item_body_animatino.dart';

class CustomNewsItemAnimation extends StatelessWidget {
  const CustomNewsItemAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomNewsImageAnimation(),
            ),
            SizedBox(
              width: 50,
            ),
            Expanded(
              flex: 2,
              child: CustomNewsItemBodyAnimation(),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: Divider(
            thickness: 2,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
