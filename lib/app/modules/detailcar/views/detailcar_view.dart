import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detailcar_controller.dart';

class DetailcarView extends GetView<DetailcarController> {
  const DetailcarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _carsDetetailC = Get.put(DetailcarController());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => _carsDetetailC.carsDetail["id"] == null
              ? const SizedBox(
                  height: 10,
                  width: 10,
                )
              : Form(
                  key: _carsDetetailC.rentFormKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height * 1 / 1.65,
                          width: Get.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(() => AspectRatio(
                                      aspectRatio: 3.5 / 2,
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                _carsDetetailC.carsDetail[
                                                        "picture"] ??
                                                    "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg",
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(() => Text(
                                                'Warna: ${_carsDetetailC.carsDetail["color"]}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Obx(() => Text(
                                                'Rp. ${_carsDetetailC.carsDetail["price"]}/hari',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        ColorsRentals.cPrimary),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Spesifikasi",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 2,
                                                    color: ColorsRentals
                                                        .cTextForm)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.groups,
                                                      size: 35),
                                                  const Text(
                                                    "Kapasitas",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Obx(() => Text(
                                                        "${_carsDetetailC.carsDetail['passenger_capacity']} Orang",
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 2,
                                                    color: ColorsRentals
                                                        .cTextForm)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                      Icons.local_gas_station,
                                                      size: 35),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(() => Text(
                                                        "${_carsDetetailC.carsDetail['fuel_capacity']} L",
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 2,
                                                    color: ColorsRentals
                                                        .cTextForm)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.car_rental,
                                                      size: 35),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(() => Text(
                                                        _carsDetetailC.carsDetail[
                                                                    "transmission"] ==
                                                                "automatic"
                                                            ? "Automatic"
                                                            : "Manual",
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Deskripsi Mobil",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _carsDetetailC
                                            .carsDetail["description"],
                                        softWrap: false,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tanggal sewa",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsRentals.cPrimary),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: Get.width * 1 / 2.3,
                                      child: TextFormField(
                                        autofocus: false,
                                        validator: (value) {
                                          return _carsDetetailC
                                              .validateRentDate(value!);
                                        },
                                        controller:
                                            _carsDetetailC.rentController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          _carsDetetailC.chooseRentDate();
                                        },
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: ColorsRentals.cTextGrey,
                                        ),
                                        decoration: InputDecoration(
                                          suffixIcon: const Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: 25),
                                            child: Icon(Icons.calendar_month),
                                          ),
                                          suffixIconColor:
                                              ColorsRentals.cTextGrey,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  25, 0, 25, 0),
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: ColorsRentals.cTextForm,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsRentals.cTextForm),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsRentals.cTextForm),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tanggal kembali",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsRentals.cPrimary),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: Get.width * 1 / 2.3,
                                      child: TextFormField(
                                        autofocus: false,
                                        validator: (value) {
                                          return _carsDetetailC
                                              .validateReturnDate(value!);
                                        },
                                        controller:
                                            _carsDetetailC.returnController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          _carsDetetailC.chooseReturnDate();
                                        },
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: ColorsRentals.cTextGrey,
                                        ),
                                        decoration: InputDecoration(
                                          suffixIcon: const Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end: 25),
                                            child: Icon(Icons.calendar_month),
                                          ),
                                          suffixIconColor:
                                              ColorsRentals.cTextGrey,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  25, 0, 25, 0),
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: ColorsRentals.cTextForm,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsRentals.cTextForm),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsRentals.cTextForm),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            ColorsRentals.cPrimary),
                                    shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _carsDetetailC.kliklanjutkan();
                                },
                                child: const Text("Lanjutkan"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
