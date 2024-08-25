import 'package:flutter/material.dart';
import 'package:news_app/Core/Constant/app_style.dart';

TabBar customTabBar(BuildContext context, TabController tabController) {
  return TabBar(
      padding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(left: 40, right: 40),
      unselectedLabelColor: const Color(0xffEBEBEB),
      unselectedLabelStyle:
          AppStyle.regular20(context).copyWith(fontWeight: FontWeight.normal),
      indicatorColor: const Color(0xffffffff),
      isScrollable: true,
      controller: tabController,
      labelStyle: AppStyle.bold25(context).copyWith(color: Colors.white),
      tabs: const [
        Tab(
          text: "ALL",
        ),
        Tab(
          text: "Politics",
        ),
        Tab(
          text: "Sports",
        ),
        Tab(
          text: "Business",
        ),
        Tab(
          text: "Enternainment",
        ),
        Tab(
          text: "science",
        ),
        Tab(
          text: "technology",
        ),
        Tab(
          text: "health",
        ),
      ]);
}
