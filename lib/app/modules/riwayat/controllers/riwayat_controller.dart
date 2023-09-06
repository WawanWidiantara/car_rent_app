// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:car_rent_app/app/data/models/cars_model.dart';
import 'package:car_rent_app/app/data/models/rent_detail_model.dart';
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
  var errmsg = "".obs;
  var carsList = <Cars>[].obs;
  var riwayatList = <RentDetail>[].obs;
  var carViews = {}.obs;
  var idSingleCar = 0.obs;
  var idSingleCarList = [].obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: riwayatTabs.length, vsync: this);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCarsData();
    fetchRiwayatData('pending');
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchCarsData() async {
    isLoading(false);
    try {
      var url = Uri.parse(
          "${UrlApi.baseAPI}/api/cars/?is_booked=False&&fields=id,name,price,picture,car_type");

      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      carsList.value = jsonItems.map<Cars>((json) {
        return Cars.fromJson(json);
      }).toList();
      update(carsList);
      isLoading(false);
      isError(false);
      update();
      return carsList;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  Future fetchRiwayatData(status) async {
    isLoading(false);
    try {
      var url = Uri.parse(
          "${UrlApi.baseAPI}/api/rentals/?customer=1&status=${status}");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      riwayatList.value = jsonItems.map<RentDetail>((json) {
        return RentDetail.fromJson(json);
      }).toList();
      print(riwayatList[0].car);
      isLoading(false);
      isError(false);
      update();
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }

  cardView() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 3 / 1.5,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                      carViews.value['picture'].toString(),
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      carViews.value['name'].toString(),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "INVOICE :",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  carViews.value['car_type'].toString(),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: ColorsRentals.cPrimary),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }

  singleCar(idCar) async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}/api/cars/$idCar/");

      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      carViews.value = result['data'];
      isLoading(false);
      isError(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
