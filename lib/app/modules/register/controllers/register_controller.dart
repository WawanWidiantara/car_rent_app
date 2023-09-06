// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:car_rent_app/app/modules/register/views/otp_view.dart';
import 'package:car_rent_app/app/modules/register/views/register_detail_view.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final detailRegisterFormKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now().obs;
  var selectedKtp = ''.obs;
  var selectedSim = ''.obs;
  var otpCode = ''.obs;
  File? imageKTP;
  File? imageSIM;

  late TextEditingController emailController,
      passwordController,
      password2Controller,
      fullNameController,
      genderController,
      dobController,
      phoneController,
      nikController,
      ktpController,
      simController;

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
  var ktp = '';
  var sim = '';

  final selectedGender = "laki-laki".obs;

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
    ktpController = TextEditingController();
    simController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
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
      return "Konfirmasi Password tidak boleh kosong";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama lengkap tidak boleh kosong";
    }
    return null;
  }

  String? validateDOB(String value) {
    if (value.isEmpty) {
      return "Tanggal lahir tidak boleh kosong";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Nomor telepon tidak boleh kosong";
    }
    return null;
  }

  String? validateNIK(String value) {
    if (value.isEmpty) {
      return "NIK tidak boleh kosong";
    }
    return null;
  }

  String? validateKTP(String value) {
    if (value.isEmpty) {
      return "Foto KTP tidak boleh kosong";
    }
    return null;
  }

  String? validateSIM(String value) {
    if (value.isEmpty) {
      return "Foto SIM tidak boleh kosong";
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
      imageKTP = File(image.path);
      selectedKtp.value = image.path.toString();
      ktpController.text = 'Unggah ulang';
      // print(selectedKtp);
    } else {
      // print("object");
    }
  }

  Future getImageSIM(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      imageSIM = File(image.path);
      selectedSim.value = image.path.toString();
      simController.text = 'Unggah ulang';
      // print(selectedSim);
    } else {
      // print("object");
    }
  }

  klikSelanjutnya(String email, String password) {
    final isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      Get.to(const RegisterDetailView());
    }
  }

  Future uploadDataRegistrasi() async {
    final isValid = detailRegisterFormKey.currentState!.validate();

    if (isValid) {
      var url = Uri.parse("${UrlApi.baseAPI}/account/register/");
      var request = http.MultipartRequest("POST", url);
      var headers = {
        'Cookie':
            'csrftoken=zuchT8FXctUzW8HYnerHUl8RjHBg7ZvQ; sessionid=w1o5qbewjmejyfz2wr4qlit6zabr9wer'
      };

      request.fields.addAll({
        'email': emailController.text,
        'password': passwordController.text,
        'password2': password2Controller.text,
        'full_name': fullNameController.text,
        'gender': selectedGender.value.toString(),
        'birth_date': selectedDate.toString().substring(0, 10),
        'phone_number': phoneController.text.toString(),
        'nik': nikController.text.toString(),
        'profile_picture': ''
      });

      request.files.add(
          await http.MultipartFile.fromPath('id_card_image', imageKTP!.path));
      request.files.add(await http.MultipartFile.fromPath(
          'license_card_image', imageSIM!.path));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString;
        _snack(
            "Berhasil Mendaftar",
            "Data anda berhasil didaftarkan, masukkan otp untuk verifikasi akun",
            "suc");
        Get.off(const OtpView());
      } else {
        _snack("Gagal Mendaftar", "${response.reasonPhrase}", "err");
      }
    }
  }

  Future submitOTP() async {
    var url = Uri.parse("${UrlApi.baseAPI}/account/otpconfirm/");
    var inputOTP = json.encode({
      "email": emailController.text,
      "otp_code": int.parse(otpCode.value),
    });
    // print(emailController)
    http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: inputOTP,
    )
        .then((res) {
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['success'] == 1) {
          _snack(
              "Berhasil Konfiramasi",
              "Akun anda berhasil diverifikasi, silahkan login untuk melanjutkan aksi",
              "suc");
          Get.offAllNamed(Routes.LOGIN);
        } else {
          _snack("Login Invalid", "Kode OTP tidak sesuai", "err");
        }
      } else {
        _snack("Kode OTP Invalid", "Kode OTP tidak ${res.statusCode}", "err");
      }
    }).catchError((err) {
      _snack("Kode OTP Invalid", "$err", "err");
    });
  }
}
