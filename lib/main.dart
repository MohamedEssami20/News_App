import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Core/Functions/open_all_storage_box.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/service_locator.dart';
import 'package:news_app/Core/Utils/simple_bloc_observer.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:news_app/Features/Splash/Presentation/views/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsEntityAdapter());
  await openAllStorgeBox();
  Bloc.observer = SimpleBlocObserver();
  setup();
  runApp(const NewsApp());

  FlutterNativeSplash.remove();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConncetionCubit(Connectivity())
            ..checkInternetConnection(),
        ),
      ],
      child: GetMaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.roboto.toString(),
        ),
        routes: {
          kHomeRoute: (context) => const HomeView(),
        },
      ),
    );
  }
}
