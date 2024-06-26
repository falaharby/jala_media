import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala_media/app/data/models/kabar_udang_model.dart';
import 'package:jala_media/app/modules/kabar_udang/controllers/kabar_udang_controller.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailKabarUdangView extends StatelessWidget {
  DetailKabarUdangView({super.key});

  final DataKabarUdang data = Get.arguments;
  final controller = Get.find<KabarUdangController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Harga Udang',
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await Share.share('$BASE_URL/posts/${data.id}');
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: WebViewWidget(
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
                    Uri.parse('$BASE_URL/web_view/posts/${data.id}'),
                  ),
              ),
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
