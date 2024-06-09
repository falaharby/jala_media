import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_media/app/routes/app_pages.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:jala_media/app/widgets/post_card.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/kabar_udang_controller.dart';

class KabarUdangView extends GetView<KabarUdangController> {
  const KabarUdangView({Key? key}) : super(key: key);
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
                controller.fetchKabarUdang();
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
                      'Kabar terbaru',
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
                    ...controller.listKabarUdang.map(
                      (e) => PostCard(
                        onTap: () {
                          Get.toNamed(Routes.KABAR_UDANG, arguments: e);
                        },
                        onShare: () {
                          Share.share('$BASE_URL/posts/${e.id}');
                        },
                        title: e.title,
                        caption: e.excerpt,
                        date: e.createdAt,
                        imgUrl: e.image,
                      ),
                    ),
                    controller.isNextPage.value
                        ? Center(
                            child: Container(
                              width: 40,
                              height: 40,
                              child: const CircularProgressIndicator(
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
