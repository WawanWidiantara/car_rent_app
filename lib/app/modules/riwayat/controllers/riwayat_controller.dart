// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:car_rent_app/app/data/models/rent_model.dart';
import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RiwayatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> riwayatTabs = <Tab>[
    const Tab(text: "Aktif"),
    const Tab(text: "Menunggu"),
    const Tab(text: "Selesai"),
  ];

  final loginC = Get.put(LoginController());
  var user = "".obs;
  var isLoading = true.obs;
  var isError = false.obs;

  var historyList = <Rent>[].obs;
  var activeHistoryList = <Rent>[].obs;
  var pendingHistoryList = <Rent>[].obs;
  var finishHistoryList = <Rent>[].obs;
  var idSingleCar = 0.obs;
  var singleHistory = {}.obs;
  var nullSingleHistory = {}.obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: riwayatTabs.length, vsync: this);
    fetchHistory('pending');
    fetchHistory('selesai');
    fetchHistory('aktif');
    update();
  }

  @override
  void onReady() {
    super.onReady();
    fetchHistory('pending');
    fetchHistory('aktif');
    fetchHistory('selesai');
    update();
  }

  @override
  void onClose() {
    Get.delete<RiwayatController>();
    super.onClose();
  }

  _snack(String title, String conntent, String tipe) {
    Get.snackbar(title, conntent,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        backgroundColor: tipe == "err" ? Colors.red : Colors.green);
  }

  makeEmptySingleHistory() {
    singleHistory.value = nullSingleHistory.value;
    update();
  }

  Future fetchHistory(String status) async {
    final userData = loginC.getStorage.read('user');
    final idUser = userData['id'];

    var url = Uri.parse(
        "${UrlApi.baseAPI}/api/rentals/?customer=$idUser&status=$status");
    final response = await http.get(url, headers: {
      'Authorization': 'Token ${loginC.getStorage.read("token")}',
    });
    if (response.statusCode == 200) {
      var result = json.decode(response.body);

      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      historyList.value = jsonItems.map<Rent>((json) {
        return Rent.fromJson(json);
      }).toList();
      update();

      if (status == 'aktif') {
        activeHistoryList.value = jsonItems.map<Rent>((json) {
          return Rent.fromJson(json);
        }).toList();
        update();
      } else if (status == 'pending') {
        pendingHistoryList.value = jsonItems.map<Rent>((json) {
          return Rent.fromJson(json);
        }).toList();
        update();
      } else {
        finishHistoryList.value = jsonItems.map<Rent>((json) {
          return Rent.fromJson(json);
        }).toList();
        update();
      }
    } else {
      _snack("Error", "${response.reasonPhrase}", "err");
    }
  }

  Future fetshSingleHistory(idInvoice) async {
    var url = Uri.parse("${UrlApi.baseAPI}/api/rentals/${idInvoice[0]}/");
    final response = await http.get(url, headers: {
      'Authorization': 'Token ${loginC.getStorage.read("token")}',
    });
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      singleHistory.value = result['data'];
      update();
    } else {
      _snack("Error", "${response.reasonPhrase}", "err");
    }
  }
}
