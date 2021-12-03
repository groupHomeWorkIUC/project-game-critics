import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_game_critics/bindings/initial_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/news_details_binding.dart';
import 'package:project_game_critics/pages/home/home_page.dart';
import 'package:project_game_critics/pages/login_page.dart';
import 'package:project_game_critics/pages/sign_up_page.dart';
import 'package:project_game_critics/pages/splash_screen.dart';

import 'constants/route_constants.dart';
import 'pages/news_details_page.dart';

class RouteManagement {
  static const initialRoute = RouteConstants.splash;
  static final List<GetPage> routeList = [
    GetPage(
      name: RouteConstants.splash,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: RouteConstants.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteConstants.signUp,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: RouteConstants.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteConstants.newsDetailsPage,
      page: () => NewsDetailsPage(),
      binding: NewsDetailsBinding(),
    ),
  ];
}
