import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Core/Constant/app_style.dart';
import 'package:news_app/Core/Constant/variable.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    slidingAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      return Get.offAllNamed(kHomeRoute);
    });
    super.initState();
  }

  void slidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.forward();
    animation = Tween(
      begin: const Offset(0.0, 3.3),
      end: Offset.zero,
    ).animate(animationController);
    animation.addListener(() {
      animationController;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 5,
            child: Image.asset(
              "assets/images/news.png",
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "News App",
            style: AppStyle.bold35(context).copyWith(),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return SlideTransition(
                position: animation,
                child: Text(
                  "You can read all news in the world.",
                  style: AppStyle.regular20(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
