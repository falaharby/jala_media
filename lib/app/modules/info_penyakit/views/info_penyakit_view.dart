import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_media/app/routes/app_pages.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:jala_media/app/widgets/post_card.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/info_penyakit_controller.dart';

class InfoPenyakitView extends GetView<InfoPenyakitController> {
  const InfoPenyakitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: appBackgroundColor,
        child: Obx(
          () => LazyLoadScrollView(
            onEndOfPage: () {
              if (controller.isNextPage.value) {
                controller.fetchListPenyakit();
              }
            },
            child: SingleChildScrollView(
              child: Container(
                color: whiteColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daftar Penyakit',
                      style: TextStyle(
                        color: primaryDarkColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ...controller.listPenyakit.map(
                      (e) => PostCard(
                        onTap: () {
                          Get.toNamed(Routes.INFO_PENYAKIT, arguments: e);
                        },
                        onShare: () {
                          Share.share('$BASE_URL/diseases/${e.id}');
                        },
                        title: '${e.fullName} (${e.shortName})',
                        caption: e.metaDescription,
                        date: e.createdAt,
                        imgUrl: e.image,
                      ),
                    ),
                    controller.isNextPage.value
                        ? const Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
