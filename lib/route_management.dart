import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_game_critics/bindings/initial_binding.dart';
import 'package:project_game_critics/pages/home_page.dart';
import 'package:project_game_critics/pages/login_page.dart';
import 'package:project_game_critics/pages/sign_up_page.dart';
import 'package:project_game_critics/pages/splash_screen.dart';

class RouteManagement {
  static const initialRoute = '/Splash';
  static final List<GetPage> routeList = [
    GetPage(
      name: '/Splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/Login',
      page: () => const LoginPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: '/Signup',
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: '/Home',
      page: () => const HomePage(),
    ),
  ];
}
