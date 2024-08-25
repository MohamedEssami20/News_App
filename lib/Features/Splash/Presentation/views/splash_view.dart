import 'package:flutter/material.dart';
import 'package:news_app/Features/Splash/Presentation/views/Widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color.fromARGB(255, 34, 34, 34),
      body: SplashViewBody(),
    );
  }
}
