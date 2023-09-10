import 'dart:convert';

import 'package:car_rent_app/app/data/models/user_model.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late User user;
  final getStorage = GetStorage();
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  RxBool isObscurePassword = true.obs;
  var email = '';
  var password = '';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  _snack(String title, String conntent, String tipe) {
    Get.snackbar(title, conntent,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        backgroundColor: tipe == "err" ? Colors.red : Colors.green);
  }

  setState() {
    isObscurePassword(!isObscurePassword.value);
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email tidak boleh kosong";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong";
    }
    return null;
  }

  kliklogin(String email, String password) {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      isLoading(true);
      var url = Uri.parse("${UrlApi.baseAPI}/account/login/");
      var inputLogin = json.encode({
        "username": email,
        "password": password,
      });
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
          // print(response['data']['user']);
          if (response['success'] == 1) {
            getStorage.write("token", response['data']['token']);
            var user = User.fromJson(response['data']['user']);
            getStorage.write('user', user.toJson());
            emailController.clear();
            passwordController.clear();
            isLoading(false);
            Get.offAllNamed(Routes.HOME);
          } else {
            isLoading(false);
            _snack("Login Invalid", "Email dan Password tidak sesuai", "err");
          }
        } else {
          _snack("Login Invalid", "Email dan Password tidak sesuai", "err");
          isLoading(false);
        }
      }).catchError((err) {
        _snack("Login Invalid", "$err", "err");
        isLoading(false);
      });
    }
    loginFormKey.currentState!.save();
  }
}
