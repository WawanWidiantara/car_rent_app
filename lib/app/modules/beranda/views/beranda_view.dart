import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _carsC = Get.put(BerandaController());
    // _carsC.fetchCarsData();
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              // SliderWidget(SliderList, "text", "text"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Hi, ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <InlineSpan>[
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: Obx(() => Text(
                                      _carsC.user.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsRentals.cPrimary),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            onChanged: (search) {},
                            onSaved: (search) {},
                            textAlignVertical: TextAlignVertical.center,
                            autofocus: false,
                            style: const TextStyle(
                              fontSize: 14,
                              color: ColorsRentals.cTextGrey,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: ColorsRentals.cTextGrey,
                              hintText: 'Search',
                              filled: true,
                              fillColor: ColorsRentals.cTextForm,
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: ColorsRentals.cTextGrey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: ColorsRentals.cTextGrey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Mobil yang tersedia",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RefreshIndicator(
                          onRefresh: () => _carsC.fetchCarsData(),
                          child: SizedBox(
                            height:
                                constraints.maxHeight - (Get.height * 1 / 5.5),
                            child: Obx(() => GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4,
                                  children: List.generate(
                                    _carsC.carsList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(top: 5),
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
                                              aspectRatio: 3.5 / 2,
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        _carsC.carsList[index]
                                                            .picture
                                                            .toString(),
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      _carsC
                                                          .carsList[index].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 80,
                                                      child: FittedBox(
                                                        child: Text(
                                                          'Rp. ${_carsC.carsList[index].price.toString()}/hari',
                                                          style: const TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorsRentals
                                                                      .cPrimary),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.DETAILCAR,
                                                        arguments: _carsC
                                                            .carsList[index]
                                                            .id);
                                                  },
                                                  child: const Icon(
                                                    Icons.arrow_forward_ios,
                                                    color:
                                                        ColorsRentals.cPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
