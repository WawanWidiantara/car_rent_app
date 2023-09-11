// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:car_rent_app/app/modules/riwayat/views/aktif_view.dart';
import 'package:car_rent_app/app/modules/riwayat/views/menunggu_view.dart';
import 'package:car_rent_app/app/modules/riwayat/views/selesai_view.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabC = Get.put(RiwayatController());
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Riwayat",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TabBar(
            controller: _tabC.controller,
            tabs: _tabC.riwayatTabs,
            labelColor: ColorsRentals.cPrimary,
            unselectedLabelColor: Colors.black,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: ColorsRentals.cPrimary,
              ),
            ),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabC.controller,
            children: const [AktifView(), MenungguView(), SelesaiView()],
          ))
        ],
      )),
    );
  }
}
