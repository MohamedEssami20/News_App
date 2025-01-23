import 'package:flutter/material.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Core/Functions/custom_tab_bar.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(
      length: 8,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6F0069),
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.13,
          title: Text("News", style: AppStyle.bold25(context)),
          centerTitle: true,
          bottom: customTabBar(context, tabController),
        ),
        body: HomeViewBody(
          index: currentIndex,
        ));
  }
}
