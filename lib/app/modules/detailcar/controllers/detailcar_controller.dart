// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:car_rent_app/app/data/models/cars_detail_model.dart';
import 'package:car_rent_app/app/modules/detailcar/views/rent_view.dart';
import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailcarController extends GetxController {
  final loginC = Get.put(LoginController());
  var idCar = Get.arguments;
  var carsDetail = {}.obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  var selectedDateRent = DateTime.now().obs;
  var selectedDateReturn = DateTime.now().obs;
  final rentFormKey = GlobalKey<FormState>();
  late TextEditingController rentController, returnController;
  var rent = '';
  var returnCar = '';
  var rentDuration = 0.obs;

  @override
  void onInit() {
    super.onInit();
    rentController = TextEditingController();
    returnController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCarsDetailData();
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

  findDuration() {
    final duration =
        selectedDateReturn.value.difference(selectedDateRent.value).inDays;
    rentDuration.value = duration;
  }

  Future fetchCarsDetailData() async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}/api/cars/$idCar/");
      http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      }).then((res) {
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          if (response['success'] == 1) {
            var car = CarsDetail.fromJson(response['data']);
            carsDetail.value = car.toJson();
          } else {
            _snack("Error", "Error while fetching data", "err");
          }
        } else {
          _snack("Error", "Error while fetching data", "err");
        }
      });
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  chooseRentDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDateRent.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      helpText: 'Pilih tanggal penyewaan',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Masukkan tanggal yang valid',
      errorInvalidText: 'Masukkan tanggal yang valid',
      fieldLabelText: 'Tanggal Lahir',
      fieldHintText: 'DD/MM/YYYY',
      selectableDayPredicate: disableDate,
    );
    if (pickedDate != null && pickedDate != selectedDateRent.value) {
      selectedDateRent.value = pickedDate;
      rentController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      update();
    }
  }

  chooseReturnDate() async {
    if (rentController.text == '') {
      _snack("Strict Action", "Isi tanggal sewa terlebih dahulu", "err");
    } else {
      DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDateRent.value.add(const Duration(days: 1)),
        firstDate: selectedDateRent.value.add(const Duration(days: 1)),
        lastDate: DateTime(2050),
        helpText: 'Pilih tanggal pengembalian mobil',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Masukkan tanggal yang valid',
        errorInvalidText: 'Masukkan tanggal yang valid',
        fieldLabelText: 'Tanggal Lahir',
        fieldHintText: 'DD/MM/YYYY',
        // selectableDayPredicate: disableDateReturn,
      );
      if (pickedDate != null && pickedDate != selectedDateReturn.value) {
        selectedDateReturn.value = pickedDate;
        returnController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      }
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 365))))) {
      return true;
    }
    return false;
  }

  String? validateRentDate(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }

  String? validateReturnDate(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }

  kliklanjutkan() {
    final isValid = rentFormKey.currentState!.validate();
    if (isValid) {
      Get.to(const RentView());
      findDuration();
    }
  }

  launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  klikPesanSekarang(int idCar, BuildContext context) {
    final userData = loginC.getStorage.read('user');
    final idUser = userData['id'];

    var url = Uri.parse("${UrlApi.baseAPI}/api/rentals/");
    var inputRent = json.encode({
      "customer": idUser,
      "car": idCar,
      "start_date": selectedDateRent.toString().substring(0, 10),
      "end_date": selectedDateReturn.toString().substring(0, 10)
    });
    http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      },
      body: inputRent,
    )
        .then((res) {
      if (res.statusCode == 201) {
        var response = json.decode(res.body);
        if (response['success'] == 1) {
          update();
          Get.offAllNamed(Routes.HOME);
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  child: AlertDialog(
                    content: Builder(
                      builder: (context) {
                        return SizedBox(
                          height: Get.height * 1 / 3,
                          width: Get.width * 1 / 4,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  size: 120,
                                  color: ColorsRentals.cGreen,
                                ),
                                const Text(
                                  "Pesanan berhasil",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Silahkan ambil kendaraan dan\n melakukan pembayaran ditempat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  ColorsRentals.cGreen),
                                          shape: MaterialStatePropertyAll<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)))),
                                      onPressed: () {},
                                      child: const Text("Lihat Pesanan")),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              });
        } else {
          _snack("Login Invalid", "Email dan Password tidak sesuai", "err");
        }
      } else {
        _snack("Error", "Error status code ${res.statusCode}", "err");
      }
      // ignore: body_might_complete_normally_catch_error
    }).catchError((err) {
      _snack("Login Invalid", "$err", "err");
    });
  }
}
