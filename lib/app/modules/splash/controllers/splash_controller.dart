// ignore_for_file: unnecessary_overrides

import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final loginC = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (loginC.getStorage.read("token") != "" &&
        loginC.getStorage.read("token") != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
