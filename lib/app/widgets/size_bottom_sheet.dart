import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';
import 'package:jala_media/app/utils/colors.dart';

class SizeBottomSheet extends StatelessWidget {
  SizeBottomSheet({
    super.key,
  });
  final controller = Get.find<HargaUdangController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 40),
                physics: const NeverScrollableScrollPhysics(),
                children: controller
                    .getListSize()
                    .map(
                      (e) => Material(
                        color: whiteColor,
                        child: InkWell(
                          onTap: () {
                            controller.size.value = e;
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: controller.size.value == e
                                ? shadowColor
                                : whiteColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Text(
                              e.toString(),
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
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(bottom: BorderSide(color: shadowColor))),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Size',
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
      ],
    );
  }
}
