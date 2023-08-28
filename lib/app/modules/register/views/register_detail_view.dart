import 'package:car_rent_app/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterDetailView extends GetView<RegisterController> {
  const RegisterDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
