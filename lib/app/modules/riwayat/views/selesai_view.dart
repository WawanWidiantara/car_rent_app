import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelesaiView extends GetView {
  const SelesaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelesaiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelesaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
