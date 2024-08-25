import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/Core/Constant/app_style.dart';

class CustomNewsBody extends StatelessWidget {
  const CustomNewsBody({
    super.key,
    required this.newsTitle,
    required this.categorieName,
    required this.newsTime,
  });
  final String newsTitle;
  final String categorieName;
  final String newsTime;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              newsTitle,
              style: AppStyle.medium18(context),
              maxLines: 3,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          // const SizedBox(
          //   height: 100,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categorieName,
                  style: AppStyle.regular16(context),
                ),
                Text(
                  Jiffy.parse(newsTime.substring(0, 16))
                      .format(pattern: "dd, MMM, yyyy"),
                  style: AppStyle.regular16(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
