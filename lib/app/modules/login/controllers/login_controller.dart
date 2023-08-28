import 'dart:convert';

import 'package:car_rent_app/app/data/models/user_model.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController
  late User user;
  final getStorage = GetStorage();
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  RxBool isObscurePassword = true.obs;
  var email = '';
  var password = '';

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
        duration: Duration(seconds: 2),
        backgroundColor: tipe == "err" ? Colors.red : Colors.green);
  }

  setState() {
    isObscurePassword(!isObscurePassword.value);
  }

  String? validateEmail(String value) {
    if (value?.isEmpty ?? true) {
      return "Email tidak boleh kosong";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value?.isEmpty ?? true) {
      return "Password tidak boleh kosong";
    }
    return null;
  }

  kliklogin(String email, String password) {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
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
            Get.offAllNamed(Routes.HOME);
          } else {
            _snack("Login Invalid", "Email dan Password tidak sesuai", "err");
          }
        } else {
          _snack("Login Invalid", "Email dan Password tidak sesuai", "err");
          // print(response['error']['non_field_errors']);
        }
      }).catchError((err) {
        print(err);
      });
    }
    loginFormKey.currentState!.save();
  }
}

//   kliklogin(String email, String password) {
//     // print(email);
//     final isValid = loginFormKey.currentState!.validate();
//     if (!isValid) {
//       return print('isra');
//     }
//     var url = Uri.parse("${UrlApi.baseAPI}/account/login/");
//     var inputLogin = json.encode({
//       "username": email,
//       "password": password,
//     });
//     http
//         .post(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: inputLogin,
//     )
//         .then((res) {
//       if (res.statusCode == 200) {
//         var response = json.decode(res.body);
//         print(response['data']['user']);
//         if (response['success'] == 1) {
//           getStorage.write("token", response['data']['token']);
//           var user = User.fromJson(response['data']['user']);
//           getStorage.write('user', user.toJson());
//           Get.offAllNamed(Routes.HOME);
//         } else {
//           print('err');
//         }
//       } else {
//         var response = json.decode(res.body);
//         print(response['error']['non_field_errors']);
//       }
//     }).catchError((err) {
//       print(err);
//     });
//   }

