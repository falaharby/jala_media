import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jala_media/app/modules/harga_udang/views/harga_udang_view.dart';
import 'package:jala_media/app/modules/info_penyakit/views/info_penyakit_view.dart';
import 'package:jala_media/app/modules/kabar_udang/views/kabar_udang_view.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/widgets/tab_header.dart';

import '../controllers/jala_media_controller.dart';

class JalaMediaView extends GetView<JalaMediaController> {
  const JalaMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: const Icon(
            Icons.arrow_back,
          ),
          title: const Text(
            'Jala Media',
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            children: [
              TabBar(
                indicatorPadding: EdgeInsets.zero,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5, color: primaryColor),
                  insets: EdgeInsets.zero,
                ),
                dividerColor: dividerColor,
                dividerHeight: 5,
                labelStyle: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: disabledColor,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  TabHeader(title: 'Harga Udang'),
                  TabHeader(title: 'Kabar Udang'),
                  TabHeader(title: 'Penyakit')
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HargaUdangView(),
                    KabarUdangView(),
                    InfoPenyakitView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
