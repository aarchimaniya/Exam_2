import 'package:flutter/cupertino.dart';
import 'package:student_detials_app/page/details_page/details_page.dart';
import 'package:student_detials_app/page/home_page/home_page.dart';
import 'package:student_detials_app/page/splash_screen/splashscreen.dart';

class AppRoutes {
  static String splashScreen = "/";
  static String homepage = "home_page";
  static String detailspage = "details_page";

  static Map<String, WidgetBuilder> route = {
    splashScreen: (context) => const SplashScreen(),
    homepage: (context) => const HomePage(),
    detailspage: (context) => const DetailsPage(),
  };
}
