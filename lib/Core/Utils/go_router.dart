
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:news_app/Features/Splash/Presentation/views/splash_view.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(path: kHomeRoute, builder: (context, state) => const SplashView()),
  GoRoute(path: "/", builder: (context, state) => const HomeView()),
],
);
