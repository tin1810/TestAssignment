import 'package:get/get.dart';
import 'package:test_assignment/routes/app_routes.dart';
import 'package:test_assignment/view/authentication/screen/login_screen.dart';
import 'package:test_assignment/view/splash/screen/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => const SplashScreen()),
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen())
  ];
}
