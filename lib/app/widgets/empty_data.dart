import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/404.png',
              height: 160,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: const TextStyle(
                color: primaryDarkColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
