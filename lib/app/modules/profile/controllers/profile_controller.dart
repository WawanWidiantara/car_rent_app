import 'dart:convert';

import 'package:car_rent_app/app/data/models/user_model.dart';
import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ProfileController extends GetxController with StateMixin {
  final loginC = Get.put(LoginController());
  var userData = {}.obs;
  var picName = ''.obs;
  RxBool isLoading = false.obs;

  final profileFormKey = GlobalKey<FormState>();
  late TextEditingController fullNameController,
      emailController,
      nikController,
      phoneController,
      genderController,
      dobController;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    nikController = TextEditingController();
    phoneController = TextEditingController();
    genderController = TextEditingController();
    dobController = TextEditingController();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    userData.value = loginC.getStorage.read('user');
    fullNameController.text = userData["full_name"];
    picName.value = userData["full_name"];
    emailController.text = userData["email"];
    nikController.text = userData["nik"];
    phoneController.text = userData["phone_number"];
    genderController.text =
        userData["gender"] == "laki-laki" ? "Laki-laki" : "Perempuan";
    var dobTime = DateTime.parse(userData["birth_date"]);
    dobController.text = DateFormat('dd MMMM yyyy').format(dobTime);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _snack(String title, String conntent, String tipe) {
    Get.snackbar(title, conntent,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        backgroundColor: tipe == "err" ? Colors.red : Colors.green);
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama tidak boleh kosong";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email tidak boleh kosong";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Nomor telepon tidak boleh kosong";
    }
    return null;
  }

  kliklogout() async {
    isLoading(true);
    var url = Uri.parse("${UrlApi.baseAPI}/account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';
    // loginC.getStorage.write("token", '');
    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      isLoading(false);
      Get.offAllNamed(Routes.LOGIN);
      _snack("Logout Berhasil", "Anda berhasil logout", "suc");
    } else {
      isLoading(false);
      _snack("Logout Failed", "Status code: ${response.statusCode}", "err");
    }
  }

  kliksimpan() {
    final isValid = profileFormKey.currentState!.validate();
    final userData = loginC.getStorage.read('user');
    final idUser = userData['id'];
    change(null, status: RxStatus.loading());
    if (isValid) {
      isLoading(true);
      var url = Uri.parse("${UrlApi.baseAPI}/account/userupdate/$idUser/");
      var inputProfil = json.encode({
        "full_name": fullNameController.text,
        "email": emailController.text,
        "phone_number": phoneController.text,
      });
      http
          .patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        body: inputProfil,
      )
          .then((res) {
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          if (response['success'] == 1) {
            picName.value = response['data']['full_name'];
            var user = User.fromJson(response['data']);
            loginC.getStorage.write('user', user.toJson());
            isLoading(false);
            _snack("Edit Berhasil", "Data profil berhasil diedit", "suc");
            update();
            Get.offAllNamed(Routes.HOME, arguments: 2);
          } else {
            isLoading(false);
            _snack("Edit Gagal", "Data profil gagal diedit", "err");
          }
        } else {
          isLoading(false);
          _snack("Edit Gagal", "Data profil gagal diedit", "err");
        }
      }).catchError((err) {
        isLoading(false);
        _snack("Edit Gagal", "$err", "err");
      });
    }
    change(null, status: RxStatus.success());
    profileFormKey.currentState!.save();
  }
}
