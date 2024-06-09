import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/jala_icons.dart';
import 'package:jala_media/app/utils/string_case.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({
    super.key,
    required this.onSubmitLocation,
    required this.onSubmitSize,
  });
  final VoidCallback onSubmitSize;
  final VoidCallback onSubmitLocation;

  final controller = Get.find<HargaUdangController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: primaryColor,
      ),
      child: Obx(
        () => Row(
          children: [
            InkWell(
              onTap: onSubmitSize,
              child: _sizeButton(context, controller),
            ),
            Expanded(
              child: InkWell(
                onTap: onSubmitLocation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 18,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        size: 24,
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          controller.selectedDaerah.value?.fullName == null
                              ? 'Indonesia'
                              : controller.selectedDaerah.value?.fullName
                                      ?.toTitleCase() ??
                                  '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _sizeButton(BuildContext context, HargaUdangController controller) {
    return Container(
      width: 136,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
      color: primaryDarkColor,
      child: Row(
        children: [
          const Icon(
            JalaIcon.timbangan,
            color: whiteColor,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              const Text(
                'Size',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 12,
                ),
              ),
              Text(
                controller.size.value.toString(),
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
