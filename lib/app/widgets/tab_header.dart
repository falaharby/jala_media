import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key, required this.title, this.height = 52});
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
