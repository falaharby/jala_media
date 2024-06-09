import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/data/models/daerah_model.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';
import 'package:jala_media/app/routes/app_pages.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/widgets/empty_data.dart';
import 'package:jala_media/app/widgets/floating_button.dart';
import 'package:jala_media/app/widgets/harga_udang_card.dart';
import 'package:jala_media/app/widgets/location_bottom_sheet.dart';
import 'package:jala_media/app/widgets/size_bottom_sheet.dart';
import 'package:jala_media/app/widgets/skeleton_harga_udang_card.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HargaUdangView extends GetView<HargaUdangController> {
  const HargaUdangView({super.key});

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
                controller.fetchHargaUdang();
              }
            },
            child: RefreshIndicator(
              color: primaryColor,
              backgroundColor: whiteColor,
              onRefresh: () async {
                controller.resetValue();
                controller.fetchHargaUdang();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _fiturLainnyaSection(context),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 2),
                      color: whiteColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Harga Terbaru',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: primaryDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: controller.fetchLoading.value
                                ? Column(
                                    children: [
                                      ...List.generate(
                                        4,
                                        (e) => const Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: SkeletonHargaUdangCard(),
                                        ),
                                      )
                                    ],
                                  )
                                : controller.listDataHargaUdang.isEmpty
                                    ? const EmptyData(
                                        title: 'Oops! Data Kosong',
                                        subtitle:
                                            'Maaf untuk saat ini data sedang kosong')
                                    : Column(
                                        children: [
                                          ...controller.listDataHargaUdang.map(
                                            (e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: HargaUdangCard(
                                                onPressed: () {
                                                  Get.toNamed(
                                                    Routes.HARGA_UDANG,
                                                    arguments: e,
                                                  );
                                                },
                                                role: 'Supplier',
                                                nama: e.creator?.name ?? '-',
                                                tanggal: e.createdAt,
                                                provinsi:
                                                    e.region?.provinceName,
                                                daerah:
                                                    e.region?.nameTranslated,
                                                size: controller.size.value,
                                                harga: e.toJson()[
                                                    'size_${controller.size.value}'],
                                                avatar: e.creator?.avatar,
                                                isVerif:
                                                    e.creator?.buyer ?? false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                          ),
                        ],
                      ),
                    ),
                    controller.isNextPage.value
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            color: whiteColor,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 60,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: const CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(
                            height: 40,
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(
        onSubmitLocation: () {
          showLocationBottomSheet(context, (daerah) {
            if (daerah == controller.selectedDaerah.value) {
              controller.selectedDaerah.value = null;
            } else {
              controller.selectedDaerah.value = daerah;
            }
            controller.resetValue();
            controller.fetchHargaUdang();
          });
        },
        onSubmitSize: () {
          showSizeBottomSheet(context);
        },
      ),
    );
  }

  Column _fiturLainnyaSection(BuildContext context) {
    return Column(
      children: [
        Container(
          color: whiteColor,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Text(
              'Coba Fitur Lainnya',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: titleColor,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: whiteColor,
          padding: const EdgeInsets.only(bottom: 16),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    width: 271,
                    image: AssetImage('assets/images/ask_jali.png'),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image(
                    width: 271,
                    image: AssetImage('assets/images/quiz_jala.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSizeBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16.0,
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (BuildContext context) {
        return SizeBottomSheet();
      },
    );
  }

  void showLocationBottomSheet(
      BuildContext context, Function(DataDaerah) onSelect) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16.0,
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (BuildContext context) {
        return LocationBottomSheet(
          onSelect: onSelect,
        );
      },
    );
  }
}
