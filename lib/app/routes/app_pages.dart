import 'package:get/get.dart';
import 'package:jala_media/app/modules/harga_udang/views/detail_harga_udang_view.dart';

import '../modules/harga_udang/views/harga_udang_view.dart';
import '../modules/info_penyakit/bindings/info_penyakit_binding.dart';
import '../modules/info_penyakit/views/info_penyakit_view.dart';
import '../modules/jala_media/bindings/jala_media_binding.dart';
import '../modules/jala_media/views/jala_media_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.JALA_MEDIA;

  static final routes = [
    GetPage(
      name: _Paths.JALA_MEDIA,
      page: () => const JalaMediaView(),
      binding: JalaMediaBinding(),
    ),
    GetPage(
      name: _Paths.HARGA_UDANG,
      page: () => DetailHargaUdangView(),
    ),
    GetPage(
      name: _Paths.INFO_PENYAKIT,
      page: () => const InfoPenyakitView(),
      binding: InfoPenyakitBinding(),
    ),
  ];
}
