import 'package:car_rent_app/app/modules/register/views/register_detail_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      password2Controller;
  RxBool isObscurePassword = true.obs;
  RxBool isObscurePassword2 = true.obs;
  var email = '';
  var password = '';
  var password2 = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setState() {
    isObscurePassword(!isObscurePassword.value);
  }

  setState2() {
    isObscurePassword2(!isObscurePassword2.value);
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

  String? validatePassword2(String value) {
    if (value?.isEmpty ?? true) {
      return "Konfirma Password tidak boleh kosong";
    }
    return null;
  }

  kliklogin(String email, String password) {
    final isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      Get.to(RegisterDetailView());
    }
  }
}
