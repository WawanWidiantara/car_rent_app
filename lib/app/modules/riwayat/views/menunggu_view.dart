import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenungguView extends GetView {
  const MenungguView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenungguView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenungguView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
