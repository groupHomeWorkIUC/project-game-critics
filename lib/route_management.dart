import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_game_critics/bindings/initial_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/game_details_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/games_page_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/login_page_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/news_details_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/profile_page_binding.dart';
import 'package:project_game_critics/bindings/page_bindings/signup_page_binding.dart';
import 'package:project_game_critics/pages/auth/profile/profile_info_page.dart';
import 'package:project_game_critics/pages/auth/profile/profile_page.dart';
import 'package:project_game_critics/pages/game/game_detail_page.dart';
import 'package:project_game_critics/pages/game/games_page.dart';
import 'package:project_game_critics/pages/home/home_page.dart';
import 'package:project_game_critics/pages/auth/login_page.dart';
import 'package:project_game_critics/pages/auth/sign_up_page.dart';
import 'package:project_game_critics/pages/splash_screen.dart';

import 'bindings/page_bindings/home_page_binding.dart';
import 'bindings/page_bindings/profile_info_page_binding.dart';
import 'constants/route_constants.dart';
import 'pages/news/news_details_page.dart';

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
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: RouteConstants.signUp,
      page: () => const SignUpPage(),
      binding: SignupPageBinding(),
    ),
    GetPage(
      name: RouteConstants.home,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: RouteConstants.newsDetailsPage,
      page: () => NewsDetailsPage(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: RouteConstants.gamesPage,
      page: () => GamesPage(),
      binding: GamesBinding(),
    ),
    GetPage(
      name: RouteConstants.gameDetailsPage,
      page: () => GameDetailsPage(),
      binding: GameDetailsBinding(),
    ),
    GetPage(
      name: RouteConstants.profilePage,
      page: () => ProfilePage(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: RouteConstants.profileInfoPage,
      page: () => ProfileInfoPage(),
      binding: ProfileInfoPageBinding(),
    ),
  ];
}