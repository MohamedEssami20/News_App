import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_body.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_image.dart';

class CustomNewsItems extends StatelessWidget {
  const CustomNewsItems(
      {super.key,
      required this.imageUrl,
      required this.newsTitle,
      required this.categorieName,
      required this.newsTime});
  final String imageUrl;
  final String newsTitle;
  final String categorieName;
  final String newsTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomNewsImage(imageUrl: imageUrl),
            ),
            const SizedBox(
              width: 80,
            ),
            Expanded(
              flex: 2,
              child: CustomNewsBody(
                newsTitle: newsTitle,
                categorieName: categorieName,
                newsTime: newsTime,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Divider(
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
