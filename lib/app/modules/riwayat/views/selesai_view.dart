import 'package:car_rent_app/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelesaiView extends GetView {
  const SelesaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final riwayatC = Get.put(RiwayatController());
    riwayatC.fetchCarsData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelesaiView'),
        centerTitle: true,
      ),
      body: Center(
          // child: riwayatC.cardView(3),
          ),
    );
  }
}
