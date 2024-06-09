import 'package:get/get.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';

import '../controllers/jala_media_controller.dart';

class JalaMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JalaMediaController>(
      () => JalaMediaController(),
    );
    Get.lazyPut<HargaUdangController>(
      () => HargaUdangController(),
    );
  }
}
