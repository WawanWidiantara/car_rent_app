import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                        const Text.rich(
                          TextSpan(
                            text: 'Hi, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <InlineSpan>[
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: Text(
                                  'Ilham Dean',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: ColorsRentals.cPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
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
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Mobil yang tersedia",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: constraints.maxHeight,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            children: List.generate(
                              20,
                              (index) => Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 3.5 / 2,
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2018/02/01/14/09/yellow-3123271_960_720.jpg",
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'BMW 3 Series',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 80,
                                                  child: FittedBox(
                                                    child: Text(
                                                      'Rp. 300000/hari',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsRentals
                                                              .cPrimary),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(Routes.DETAILCAR);
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorsRentals.cPrimary,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 500,
                          color: Colors.pink,
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
