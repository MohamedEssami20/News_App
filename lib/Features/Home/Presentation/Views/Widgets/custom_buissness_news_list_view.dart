
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/animate_to_top_list.dart';
import 'package:news_app/Core/Functions/check_internet_in_page.dart';
import 'package:news_app/Core/Functions/launch_url.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Bussiness_News_Cubit/bussiness_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/custom_news_item.dart';

class CustomBuissnessNewsListView extends StatefulWidget {
  const CustomBuissnessNewsListView(
      {super.key, required this.newsData, required this.currentIndex});
  final List<NewsEntity> newsData;
  final int currentIndex;
  @override
  State<CustomBuissnessNewsListView> createState() =>
      _CustomBuissnessNewsListViewState();
}

class _CustomBuissnessNewsListViewState
    extends State<CustomBuissnessNewsListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
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
        if (isLoading == true &&
            internetConnection is InternetConncetionSuccess) {
          await BlocProvider.of<BussinessNewsCubit>(context)
              .getBussinessNews(pageNumber: ++nextPage, context: context);
          isLoading = false;
        }
        isLoading = false;
      }
    }
  }

  Future<void> _refreshPage() async {
    if (!mounted) return;
    final bussinessNews = context.read<BussinessNewsCubit>();
    await bussinessNews.refreshBussinessPage(context, mounted);
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
          widget.currentIndex == 3
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
