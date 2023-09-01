// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:car_rent_app/app/modules/register/views/register_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final detailRegisterFormKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now().obs;
  var selectedKtp = ''.obs;
  var selectedSim = ''.obs;

  late TextEditingController emailController,
      passwordController,
      password2Controller,
      fullNameController,
      genderController,
      dobController,
      phoneController,
      nikController;

  RxBool isObscurePassword = true.obs;
  RxBool isObscurePassword2 = true.obs;

  var email = '';
  var password = '';
  var password2 = '';
  var fullName = '';
  var gender = '';
  var dob = '';
  var phone = '';
  var nik = '';

  final selectedGender = "Laki-laki".obs;

  void setSelected(value) {
    selectedGender.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    fullNameController = TextEditingController();
    genderController = TextEditingController();
    dobController = TextEditingController();
    phoneController = TextEditingController();
    nikController = TextEditingController();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  setState() {
    isObscurePassword(!isObscurePassword.value);
  }

  setState2() {
    isObscurePassword2(!isObscurePassword2.value);
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

  String? validatePassword2(String value) {
    if (value.isEmpty) {
      return "Konfirma Password tidak boleh kosong";
    }
    return null;
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Pilih tanggal lahir anda',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Masukkan tanggal yang valid',
      errorInvalidText: 'Masukkan tanggal yang valid',
      fieldLabelText: 'Tanggal Lahir',
      fieldHintText: 'DD/MM/YYYY',
      // selectableDayPredicate: disableDate,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dobController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1000))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 0))))) {
      return true;
    }
    return false;
  }

  Future getImageKTP(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      selectedKtp.value = image.path.toString();
      // print(selectedKtp);
    } else {
      // print("object");
    }
  }

  Future getImageSIM(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      selectedSim.value = image.path.toString();

      // print(selectedSim);
    } else {
      // print("object");
    }
  }

  kliklogin(String email, String password) {
    final isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      Get.to(const RegisterDetailView());
    }
  }
}
