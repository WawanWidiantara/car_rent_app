import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final loginC = Get.put(LoginController());
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // kliklogout() {
  //   var url = Uri.parse(UrlApi.baseAPI + "/account/logout/");
  //   var token = loginC.getStorage.read("token");
  //   http.get(
  //     url,
  //     headers: {
  //       'Authorization': 'Token $token',
  //     },
  //   ).then((res) {
  //     if (res.statusCode == 200) {
  //       loginC.getStorage.write('token', '');
  //       Get.offAllNamed(Routes.LOGIN);
  //     } else {
  //       print(token);
  //     }
  //   }).catchError((err) {
  //     print(err);
  //   });
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  kliklogout() async {
    var url = Uri.parse("${UrlApi.baseAPI}/account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';
    // loginC.getStorage.write("token", '');
    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      Get.offAllNamed(Routes.LOGIN);
      print('success');
    } else {
      print(response.statusCode);
    }
  }
}
