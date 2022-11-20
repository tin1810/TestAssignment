import 'package:get/get.dart';
import 'package:test_assignment/routes/app_routes.dart';
import 'package:test_assignment/view/login_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen())
  ];
}
