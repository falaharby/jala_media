import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/jala_icons.dart';

class BadgeTerverifikasi extends StatelessWidget {
  const BadgeTerverifikasi(
      {super.key, this.verified = false, this.iconVerif = false});
  final bool verified, iconVerif;

  @override
  Widget build(BuildContext context) {
    if (verified) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            27.5,
          ),
          color: badgeYellowColor,
        ),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: gradientYellowColor,
              ),
              child: Icon(
                iconVerif ? JalaIcon.verified : Icons.star,
                size: 12,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              'Terverifikasi',
              style: TextStyle(
                fontSize: 12,
                color: titleColor,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            27.5,
          ),
          color: borderColor,
        ),
        child: const Text(
          'belum terverifikasi',
          style: TextStyle(
            fontSize: 12,
            color: titleColor,
            letterSpacing: 0.3,
          ),
        ),
      );
    }
  }
}
