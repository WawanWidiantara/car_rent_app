import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
