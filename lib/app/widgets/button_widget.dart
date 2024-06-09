import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onPressed, required this.text});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: primaryDarkColor,
        backgroundColor: primaryColor,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
