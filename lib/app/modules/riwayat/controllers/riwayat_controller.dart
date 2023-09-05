import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> riwayatTabs = <Tab>[
    Tab(text: "Aktif"),
    Tab(text: "Menunggu"),
    Tab(text: "Selesai"),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: riwayatTabs.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
