import 'package:car_rent_app/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailRiwayatView extends GetView {
  const DetailRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final riwayatC = Get.put(RiwayatController());
    var idHistory = Get.arguments;
    riwayatC.fetshSingleHistory(idHistory);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              riwayatC.makeEmptySingleHistory();
              Get.back(closeOverlays: true);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Riwayat",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => riwayatC.singleHistory.isEmpty
              ? const SizedBox(
                  height: 10,
                  width: 10,
                )
              : SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Honda Jazz',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Honda Jazz',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRentals.cPrimary),
                            ),
                            TopCornerStatus()
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: Get.width,
                          height: Get.height * 1 / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  riwayatC.singleHistory['car']['picture'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorsRentals.cPrimary),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '5 hari ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Material(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width,
                            height: Get.height * 1 / 2.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.event_note_outlined,
                                            color: ColorsRentals.cPrimary,
                                            size: 18,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Detail Sewa',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: ColorsRentals.cPrimary),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Nama mobil',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Jenis mobil',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Warna',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Transmisi',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Nomor mobil',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Tanggal sewa',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Tanggal kembali',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Denda',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'INVOICE : ${idHistory[0]}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Obx(() => Text(
                                            // '_carsDetetailC.carsDetail["name"]',
                                            // "avanza",
                                            riwayatC.singleHistory['car']
                                                    ['name']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['car']
                                                    ['car_type']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['car']
                                                    ['color']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['car']
                                                            ['transmission']
                                                        .toString() ==
                                                    "automatic"
                                                ? "Automatic"
                                                : "Manual",
                                            // 'Manual',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['car']
                                                    ['license_plate']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['start_date']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      Obx(() => Text(
                                            riwayatC.singleHistory['end_date']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Rp. ${riwayatC.singleHistory["late_fee"].toString()}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Rp. ${riwayatC.singleHistory["total_payment"].toString()}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: ColorsRentals.cPrimary),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AdminButton(),
                      ],
                    ),
                  )),
        ));
  }
}

class AdminButton extends StatelessWidget {
  const AdminButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var idHistory = Get.arguments;
    if (idHistory[1] == 'aktif') {
      return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(ColorsRentals.cPrimary),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          onPressed: () {
            FocusScope.of(context).unfocus();
          },
          child: const Text("Hubungi Admin"),
        ),
      );
    } else {
      return Container();
    }
  }
}

class TopCornerStatus extends StatelessWidget {
  const TopCornerStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var idHistory = Get.arguments;
    if (idHistory[1] == 'aktif') {
      return Container(
        width: 70,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsRentals.cPrimary),
        child: const Center(
          child: Text(
            'Aktif',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    } else if (idHistory[1] == 'pending') {
      return Container(
        width: 70,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsRentals.cYellow),
        child: const Center(
          child: Text(
            'Menunggu',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    } else {
      return Container(
        width: 70,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsRentals.cGreen),
        child: const Center(
          child: Text(
            'Selesai',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }
  }
}
