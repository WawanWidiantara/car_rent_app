import 'package:car_rent_app/app/modules/riwayat/views/aktif_view.dart';
import 'package:car_rent_app/app/modules/riwayat/views/menunggu_view.dart';
import 'package:car_rent_app/app/modules/riwayat/views/selesai_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tabC = Get.put(RiwayatController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('RiwayatView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabC.controller,
              tabs: _tabC.riwayatTabs,
              labelColor: Colors.amber,
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.amber,
                ),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabC.controller,
              children: [AktifView(), MenungguView(), SelesaiView()],
            ))
          ],
        ));
  }
}
