import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Core/Functions/custom_tab_bar.dart';
import 'package:news_app/Features/Home/Presentation/Views/Widgets/home_view_body.dart';

import '../Manager/home_view_cubit.dart/home_view_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late HomeViewCubit homeViewCubit;
  @override
  void initState() {
    homeViewCubit = HomeViewCubit(this);
    super.initState();
  }
  
  @override
  void dispose() {
    homeViewCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6F0069),
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.13,
          title: Text("News", style: AppStyle.bold25(context)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: BlocBuilder<HomeViewCubit, int>(
              builder: (context, currentIndex) {

                return customTabBar(context, homeViewCubit.tabController);
              },
            ),
          ),
        ),
        body: BlocBuilder<HomeViewCubit, int>(builder: (context, currentIndex) {
          return HomeViewBody(
            index: currentIndex,
          );
        }, ),
      ),
    );
  }
}
