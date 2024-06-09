import 'package:get/get.dart';

import '../controllers/info_penyakit_controller.dart';

class InfoPenyakitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoPenyakitController>(
      () => InfoPenyakitController(),
    );
  }
}
