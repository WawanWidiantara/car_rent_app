import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailcar_controller.dart';

class DetailcarView extends GetView<DetailcarController> {
  const DetailcarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailcarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailcarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
