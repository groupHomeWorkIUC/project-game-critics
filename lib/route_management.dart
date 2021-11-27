import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_game_critics/bindings/initial_binding.dart';
import 'package:project_game_critics/pages/login_page.dart';
import 'package:project_game_critics/pages/splash_screen.dart';

class RouteManagement {
  static final initialRoute = '/Splash';
  static final List<GetPage> routeList = [
    GetPage(
      name: '/Splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/Login',
      page: () => LoginPage(),
      binding: InitialBinding(),
    ),
  ];
}
