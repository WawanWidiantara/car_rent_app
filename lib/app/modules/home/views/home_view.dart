import 'package:car_rent_app/app/modules/beranda/views/beranda_view.dart';
import 'package:car_rent_app/app/modules/profile/views/profile_view.dart';
import 'package:car_rent_app/app/modules/riwayat/views/riwayat_view.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            BerandaView(),
            RiwayatView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorsRentals.cPrimary,
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_outlined,
                color: ColorsRentals.cPrimary,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: ColorsRentals.cBgIcon,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.history,
                color: ColorsRentals.cPrimary,
              ),
              icon: Icon(
                Icons.history,
                color: ColorsRentals.cBgIcon,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: ColorsRentals.cPrimary,
              ),
              icon: Icon(
                Icons.account_circle_outlined,
                color: ColorsRentals.cBgIcon,
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
