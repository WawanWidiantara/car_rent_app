import 'package:car_rent_app/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:car_rent_app/app/modules/riwayat/views/detail_riwayat_view.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AktifView extends GetView {
  const AktifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final riwayatC = Get.put(RiwayatController());
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              // SliderWidget(SliderList, "text", "text"),
              Obx(() => Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: SizedBox(
                          height: constraints.maxHeight - (Get.height * 1 / 50),
                          child: RefreshIndicator(
                            onRefresh: () {
                              return Future.delayed(const Duration(seconds: 1),
                                  () {
                                riwayatC.fetchHistory('pending');
                                riwayatC.fetchHistory('selesai');
                                riwayatC.fetchHistory('aktif');
                              });
                            },
                            child: ListView.builder(
                              itemCount: riwayatC.activeHistoryList.isEmpty
                                  ? 1
                                  : riwayatC.activeHistoryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: riwayatC.activeHistoryList.isEmpty
                                      ? SizedBox(
                                          height: Get.height * 1 / 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  'assets/icons/Male car dealership salesman gives car keys to female customer.png'),
                                              const Text(
                                                "Belum ada riwayat sewa mobil",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Get.to(() => DetailRiwayatView(),
                                                arguments: [
                                                  riwayatC
                                                      .activeHistoryList[index]
                                                      .id,
                                                  'aktif'
                                                ]);
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 3 / 1.5,
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            riwayatC
                                                                .activeHistoryList[
                                                                    index]
                                                                .car!
                                                                .picture
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 10, 20, 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            riwayatC
                                                                .activeHistoryList[
                                                                    index]
                                                                .car!
                                                                .name
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "INVOICE : ${riwayatC.activeHistoryList[index].id.toString()}",
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        riwayatC
                                                            .activeHistoryList[
                                                                index]
                                                            .car!
                                                            .carType
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: ColorsRentals
                                                                .cPrimary),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
