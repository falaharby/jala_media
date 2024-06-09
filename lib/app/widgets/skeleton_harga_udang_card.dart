import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonHargaUdangCard extends StatelessWidget {
  const SkeletonHargaUdangCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: blackColor.withOpacity(0.04),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200] as Color,
                    highlightColor: Colors.grey[100] as Color,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200] as Color,
                        highlightColor: Colors.grey[100] as Color,
                        child: Container(
                          width: 80,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200] as Color,
                        highlightColor: Colors.grey[100] as Color,
                        child: Container(
                          width: 120,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[200] as Color,
                highlightColor: Colors.grey[100] as Color,
                child: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[200] as Color,
            highlightColor: Colors.grey[100] as Color,
            child: Container(
              width: 120,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[200] as Color,
                  highlightColor: Colors.grey[100] as Color,
                  child: Container(
                    width: 60,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[200] as Color,
                  highlightColor: Colors.grey[100] as Color,
                  child: Container(
                    width: 180,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[200] as Color,
                      highlightColor: Colors.grey[100] as Color,
                      child: Container(
                        width: 80,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[200] as Color,
                      highlightColor: Colors.grey[100] as Color,
                      child: Container(
                        width: 120,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[200] as Color,
                  highlightColor: Colors.grey[100] as Color,
                  child: Container(
                    width: 130,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
