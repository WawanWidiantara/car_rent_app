import 'dart:convert';

import 'package:car_rent_app/app/data/models/user_model.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final getStorage = GetStorage();
  late User user;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  kliklogin(String email, String password) {
    var url = Uri.parse(UrlApi.baseAPI + "/account/login/");
    var inputLogin = json.encode({"username": email, "password": password});
    http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: inputLogin,
    )
        .then((res) {
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['status'] == 1) {
          getStorage.write("token", response['token']);
          var user = User.fromJson(response['user']);
          getStorage.write('user', user.toJson());
          Get.offAllNamed(Routes.HOME);
        } else {}
      } else {
        print('err');
      }
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
