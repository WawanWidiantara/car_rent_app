import 'package:car_rent_app/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AktifView extends GetView {
  const AktifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final riwayatC = Get.put(RiwayatController());
    riwayatC.fetchCarsData();
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
                            onRefresh: () =>
                                riwayatC.fetchRiwayatData('pending'),
                            child: ListView.builder(
                              itemCount: riwayatC.carsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                // riwayatC.idSingleCar.value = int.parse(
                                //     riwayatC.riwayatList[index].car.toString());
                                // print(riwayatC.idSingleCar.value);
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 3 / 1.5,
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    riwayatC
                                                        .carsList[index].picture
                                                        .toString(),
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    riwayatC
                                                        .carsList[index].name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "INVOICE : ${riwayatC.carsList[index].name.toString().substring(0, 5)}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                riwayatC.carsList[index].carType
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        ColorsRentals.cPrimary),
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
