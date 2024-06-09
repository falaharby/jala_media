import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/data/models/daerah_model.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/daerah_controller.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/jala_icons.dart';
import 'package:jala_media/app/utils/string_case.dart';
import 'package:jala_media/app/widgets/empty_data.dart';
import 'package:jala_media/app/widgets/search_widget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shimmer/shimmer.dart';

class LocationBottomSheet extends StatefulWidget {
  LocationBottomSheet({
    super.key,
    required this.onSelect,
  });
  final Function(DataDaerah) onSelect;

  @override
  State<LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  final controller = Get.put(DaerahController());
  final udangController = Get.find<HargaUdangController>();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text = controller.search.value;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Obx(
            () => LazyLoadScrollView(
              onEndOfPage: () {
                if (controller.isNextPage.value) {
                  controller.fetchDaerah();
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.0)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: controller.fetchLoading.value
                      ? _skeletonList(context)
                      : controller.listDaerah.isEmpty
                          ? const EmptyData(
                              title: 'Oops! Wilayah Tidak Ditemukan',
                              subtitle: 'Tidak ditemukan wilayah untuk dipilih',
                            )
                          : Column(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 75),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: controller
                                      .listDaerah()
                                      .map(
                                        (e) => Material(
                                          color: whiteColor,
                                          child: InkWell(
                                            onTap: () {
                                              widget.onSelect(e);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: udangController
                                                          .selectedDaerah
                                                          .value ==
                                                      e
                                                  ? shadowColor
                                                  : whiteColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(
                                                e.fullName
                                                    .toString()
                                                    .toTitleCase(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                controller.isNextPage.value
                                    ? Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        width: 40,
                                        height: 40,
                                        child: const CircularProgressIndicator(
                                          color: primaryColor,
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kota/kabupaten',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 8,
                ),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    bottom: BorderSide(color: shadowColor),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchWidget(
                        hint: 'Cari',
                        searchController: searchController,
                        onSearch: (query) {
                          controller.search.value = query;
                          controller.resetValue();
                          controller.fetchDaerah();
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                        controller.search.value = '';
                        controller.resetValue();
                        controller.fetchDaerah();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 12,
                          right: 4,
                        ),
                        child: const Icon(
                          JalaIcon.danger,
                          color: greyIconColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container _skeletonList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 8),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(10, (e) {
          int randomWidth = Random().nextInt(240) + 120;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200] as Color,
              highlightColor: Colors.grey[100] as Color,
              child: Container(
                width: randomWidth.toDouble(),
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
