import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/data/models/penyakit_model.dart';
import 'package:jala_media/app/modules/info_penyakit/controllers/info_penyakit_controller.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailInfoPenyakitView extends StatelessWidget {
  DetailInfoPenyakitView({super.key});

  final DataPenyakit data = Get.arguments;
  final controller = Get.find<InfoPenyakitController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Info Penyakit',
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await Share.share('$BASE_URL/diseases/${data.id}');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.share_outlined,
                color: whiteColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: appBackgroundColor,
      body: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    controller.webviewLoading.value = progress;
                  },
                ),
              )
              ..loadRequest(
                Uri.parse('$BASE_URL/web_view/diseases/${data.id}'),
              ),
          ),
          Obx(
            () => controller.webviewLoading.value == 100
                ? const SizedBox()
                : LinearProgressIndicator(
                    backgroundColor: dividerColor,
                    color: primaryColor,
                    value: (controller.webviewLoading.value / 100).toDouble(),
                  ),
          ),
        ],
      ),
    );
  }
}
