import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/service_locator.dart';
import 'package:news_app/Features/Home/Presentation/Manager/All_News_Cubit/all_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Bussiness_News_Cubit/bussiness_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Enternainment_News_Cubit/enternainment_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Health_News_Cubit/health_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Poltics_News_Cubit/poltics_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Science_News_Cubit.dart/science_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Sports_News_Cubit/sports_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Technology_news_Cubit/technology_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/all_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/buissness_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/enternaiment_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/health_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/poltics_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/science_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/sports_news_list_view.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/technology_news_list_view.dart';
import 'package:news_app/Features/Home/data/Repos_impl/news_repos_impl.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllNewsCubit(getIt.get<NewsReposImpl>())
            ..getAllNews(context: context),
        ),
        BlocProvider(
          create: (context) => PolticsCubit(getIt.get<NewsReposImpl>())
            ..getPolticsNews(context: context),
        ),
        BlocProvider(
          create: (context) => SportsNewsCubit(getIt.get<NewsReposImpl>())
            ..getSportsNews(context: context),
        ),
        BlocProvider(
          create: (context) => BussinessNewsCubit(getIt.get<NewsReposImpl>())
            ..getBussinessNews(context: context),
        ),
        BlocProvider(
          create: (context) => EnternainmentNewsCubit(getIt.get<NewsReposImpl>())
            ..getEnternainmentNews(context: context),
        ),
        BlocProvider(
          create: (context) => ScienceNewsCubit(getIt.get<NewsReposImpl>())
            ..getScienceNews(context: context),
        ),
        BlocProvider(
          create: (context) => TechnologyNewsCubit(getIt.get<NewsReposImpl>())
            ..getTechnologyNews(context: context),
        ),
        BlocProvider(
          create: (context) => HealthNewsCubit(getIt.get<NewsReposImpl>())
            ..getHealthNews(context: context),
        ),
      ],
      child: IndexedStack(
        index: index,
        children: [
           AllNewsListView(currrentIndex: index,),
           PolticsNewsListView(currentIndex: index,),
           SportsNewsListView(currentIndex: index,),
           BuissnessNewsListView(currentIndex: index,),
           EnternaimentNewsListView(currentIndex: index,),
           ScienceNewsListView(currentIndex: index,),
           TechnologyNewsListView(currentIndex: index,),
           HealthNewsListView(currentIndex: index,),
        ],
      ),
    );
  }
}
