// import 'package:get/get.dart';
// import 'package:test_assignment/utils/enum.dart';
// import 'package:test_assignment/utils/store_manager.dart';

// class SplashController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     Future.delayed(Duration(microseconds: 1), () {
//       // String? token = getToken();
//       // if (checkLogin1(token)) {
//       //   Get.offAllNamed('/home');
//       // } else {
//       //   Get.offAllNamed('/login');
//       // }
//       Get.offAllNamed("/login");
//     });
//   }
// }
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorge.read("id") != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed('/home');
      });
    } else {
      Get.offAllNamed('/login');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
