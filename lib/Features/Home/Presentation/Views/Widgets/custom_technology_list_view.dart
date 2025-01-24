import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/animate_to_top_list.dart';
import 'package:news_app/Core/Functions/check_internet_in_page.dart';
import 'package:news_app/Core/Functions/launch_url.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Technology_news_Cubit/technology_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_item.dart';

class CustomTechnologyListView extends StatefulWidget {
  const CustomTechnologyListView(
      {super.key, required this.newsData, required this.currentIndex});
  final List<NewsEntity> newsData;
  final int currentIndex;
  @override
  State<CustomTechnologyListView> createState() =>
      _CustomTechnologyListViewState();
}

class _CustomTechnologyListViewState extends State<CustomTechnologyListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  bool? isInternetConnected;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(myListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        checkInternetatLastOfNewsList(
            currentIndex: scrollController.position.pixels,
            maxScroll: scrollController.position.maxScrollExtent,
            context: context,
           );
      });
      isInternetConnected = context.read<InternetConncetionCubit>().state
          is InternetConncetionSuccess;
    });
    super.initState();
  }

  void myListener() async {
    double currentIndex = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final internetConnection = context.read<InternetConncetionCubit>().state;
    if (currentIndex > 0.70 * maxScroll) {
      if (isLoading == false) {
        isLoading = true;
        log("Is loading in 1= $isLoading");
        if (isLoading == true &&
            internetConnection is InternetConncetionSuccess) {
          await BlocProvider.of<TechnologyNewsCubit>(context)
              .getTechnologyNews(pageNumber: ++nextPage, context: context);
          log("next pageNumber in listener= $nextPage");
          isLoading = false;
          log("Is loading in 4= $isLoading");
        }
        isLoading = false;
      }
    }
  }

  Future<void> _refreshPage() async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    final internetConnection = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnection is InternetConncetionSuccess;

    if (isInternetConnected) {
      await _fetchTechnologyNews();
    } else {
      if (mounted) {
        showErrorSnackbar(
            context, "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }

  Future<void> _fetchTechnologyNews() async {
    await BlocProvider.of<TechnologyNewsCubit>(context)
        .getTechnologyNews(pageNumber: 1, context: context);
    if (mounted) {
      setState(() {
        nextPage = 1;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) {
        if (didPop) {
          return;
        } else {
          widget.currentIndex == 6
              ? animatedtoTopofList(
                  context: context, scrollController: scrollController)
              : null;
        }
      },
      child: RefreshIndicator(
        onRefresh: _refreshPage,
        color: const Color(0xff6F0069),
        backgroundColor: Colors.white,
        displacement: 70,
        strokeWidth: 3,
        child: ListView.builder(
          controller: scrollController,
          itemCount: widget.newsData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await launchNewsUrl(
                    context: context, newsUrl: widget.newsData[index].newsUrl);
              },
              child: CustomNewsItems(
                imageUrl: widget.newsData[index].newsImage,
                newsTitle: widget.newsData[index].newsTitle,
                categorieName: widget.newsData[index].newsCatgorie,
                newsTime: widget.newsData[index].newsTime,
              ),
            );
          },
        ),
      ),
    );
  }
}
