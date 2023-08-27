import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsRentals.cPrimary,
        ),
        child: Center(
          child: Image.asset(
            IconsRental.logo,
            width: Get.width / 2,
            height: Get.height / 4,
          ),
        ),
      ),
    );
  }
}
