import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/info_penyakit_controller.dart';

class InfoPenyakitView extends GetView<InfoPenyakitController> {
  const InfoPenyakitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoPenyakitView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InfoPenyakitView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
