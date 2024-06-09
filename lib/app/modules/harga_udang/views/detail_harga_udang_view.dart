import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jala_media/app/data/models/harga_udang_model.dart';
import 'package:jala_media/app/modules/harga_udang/controllers/harga_udang_controller.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:jala_media/app/utils/price.dart';
import 'package:jala_media/app/widgets/badge_terverifikasi.dart';
import 'package:jala_media/app/widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class DetailHargaUdangView extends StatelessWidget {
  DetailHargaUdangView({super.key});

  final DataUdang hargaUdang = Get.arguments;
  final controller = Get.find<HargaUdangController>();

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
              await Share.share('$BASE_URL/shrimp_prices/${hargaUdang.id}');
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _locationSection(context),
            _creatorSection(context),
            _hargaSection(context),
            _catatanSection(context),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Container _locationSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      padding: const EdgeInsets.all(12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nusa Tenggara Barat',
            style: TextStyle(
              color: titleColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'Sumba',
            style: TextStyle(
              color: greyIconColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );
  }

  Container _hargaSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Daftar Harga',
              style: TextStyle(
                color: titleDetailColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...controller.getListSize().map(
                (e) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          'Size $e',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          hargaUdang.toJson()['size_$e'] == null
                              ? '-'
                              : Price().price(
                                  hargaUdang.toJson()['size_$e'] ?? 0, 'Rp '),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Container _creatorSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                DateFormat("dd MMMM yyyy", 'id_ID')
                    .format(DateTime.parse(hargaUdang.createdAt ?? '')),
                style: const TextStyle(
                  color: greyIconColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              BadgeTerverifikasi(
                verified: hargaUdang.creator?.buyer ?? false,
                iconVerif: true,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: hargaUdang.creator?.avatar != null
                      ? DecorationImage(
                          image: NetworkImage(
                            STORAGE_URL + (hargaUdang.creator?.avatar ?? ''),
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Supplier',
                    style: TextStyle(
                      fontSize: 12,
                      color: hintColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    hargaUdang.creator?.name ?? '-',
                    style: const TextStyle(
                      fontSize: 14,
                      color: titleDetailColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kontak',
                        style: TextStyle(
                          fontSize: 12,
                          color: hintColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                      Text(
                        hargaUdang.creator?.phone ?? '-',
                        style: const TextStyle(
                          fontSize: 16,
                          color: titleDetailColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  onPressed: () async {
                    Uri phone = Uri.parse('tel:${hargaUdang.creator?.phone}');
                    await launchUrl(phone);
                  },
                  text: 'Hubungi',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _catatanSection(BuildContext context) {
    return hargaUdang.remark != null
        ? Container(
            width: MediaQuery.of(context).size.width,
            color: whiteColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Catatan',
                    style: TextStyle(
                      color: titleDetailColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Text(
                  hargaUdang.remark ?? '',
                  style: const TextStyle(
                    color: titleDetailColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: 16,
            width: MediaQuery.of(context).size.width,
            color: whiteColor,
          );
  }
}
