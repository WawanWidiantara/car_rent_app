import 'package:get/get.dart';

import '../controllers/detailcar_controller.dart';

class DetailcarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailcarController>(
      () => DetailcarController(),
    );
  }
}
