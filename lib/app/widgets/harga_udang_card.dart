import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';
import 'package:jala_media/app/utils/price.dart';
import 'package:jala_media/app/widgets/badge_terverifikasi.dart';
import 'package:jala_media/app/widgets/button_widget.dart';

class HargaUdangCard extends StatelessWidget {
  HargaUdangCard({
    super.key,
    this.role,
    this.nama,
    this.tanggal,
    this.provinsi,
    this.daerah,
    this.harga,
    this.avatar,
    this.isVerif = false,
    this.size = 0,
    required this.onPressed,
  });
  String? role, nama, tanggal, provinsi, daerah, avatar;
  bool isVerif;
  int? size, harga;
  VoidCallback onPressed;

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
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: avatar != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  STORAGE_URL + (avatar ?? ''),
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
                        Text(
                          role ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: captionColor,
                            letterSpacing: 0.3,
                          ),
                        ),
                        Text(
                          nama ?? '-',
                          style: const TextStyle(
                            fontSize: 14,
                            color: titleColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              BadgeTerverifikasi(
                verified: isVerif,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            DateFormat("dd MMMM yyyy", 'id_ID')
                .format(DateTime.parse(tanggal ?? '')),
            style: const TextStyle(
              fontSize: 12,
              color: captionColor,
              letterSpacing: 0.3,
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
                Text(
                  provinsi ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: titleColor,
                  ),
                ),
                Text(
                  daerah ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'size $size',
                      style: const TextStyle(
                        fontSize: 12,
                        color: captionColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Text(
                      harga == null ? 'IDR -' : Price().price(harga ?? 0, null),
                      style: const TextStyle(
                        fontSize: 22,
                        color: titleColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  onPressed: onPressed,
                  text: 'LIHAT DETAIL',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
