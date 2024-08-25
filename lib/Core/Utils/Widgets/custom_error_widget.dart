import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/Widgets/error_snack_bar.dart';
import 'package:news_app/Features/Home/Presentation/Manager/All_News_Cubit/all_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Bussiness_News_Cubit/bussiness_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Enternainment_News_Cubit/enternainment_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Health_News_Cubit/health_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Poltics_News_Cubit/poltics_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Science_News_Cubit.dart/science_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Sports_News_Cubit/sports_news_cubit.dart';
import 'package:news_app/Features/Home/Presentation/Manager/Technology_news_Cubit/technology_news_cubit.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  Future<void> _onRefresh() async {
    final internetConnection = context.read<InternetConncetionCubit>().state;
    if (internetConnection is InternetConncetionSuccess) {
      await Future.delayed(
        const Duration(seconds: 3),
      );

      if (!mounted) return;
      // استخدام Future.wait لجلب البيانات بالتوازي
      await Future.wait([
        context.read<AllNewsCubit>().getAllNews(context: context),
        context.read<PolticsCubit>().getPolticsNews(context: context),
        context.read<SportsNewsCubit>().getSportsNews(context: context),
        context.read<BussinessNewsCubit>().getBussinessNews(context: context),
        context
            .read<EnternainmentNewsCubit>()
            .getEnternainmentNews(context: context),
        context.read<ScienceNewsCubit>().getScienceNews(context: context),
        context.read<TechnologyNewsCubit>().getTechnologyNews(context: context),
        context.read<HealthNewsCubit>().getHealthNews(context: context),
      ]);
    } else {
      await Future.delayed(
        const Duration(milliseconds: 1300),
      );

      if (!mounted) return;
      showErrorSnackbar(
          context, "No Internet Connection, try again", Icons.wifi_off);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: const Color(0xff6F0069),
      backgroundColor: Colors.white,
      displacement: 70,
      strokeWidth: 3,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                400, // Set the minimum height to the height of the screen
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: [
                Text(
                  widget.errorMessage,
                  style: AppStyle.semiBold20(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
