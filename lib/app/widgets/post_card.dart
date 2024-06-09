import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/config.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    this.imgUrl,
    this.title,
    this.caption,
    this.date,
    required this.onTap,
    required this.onShare,
  });
  final String? imgUrl, title, caption, date;
  final VoidCallback onTap, onShare;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              imgUrl == null
                  ? const SizedBox()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      decoration: BoxDecoration(
                        color: shadowColor,
                        image: DecorationImage(
                          image: NetworkImage(STORAGE_URL + (imgUrl ?? '')),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '-',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        color: titleColor,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      caption ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: greyIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat("dd MMMM yyyy", 'id_ID')
                          .format(DateTime.parse(date ?? '')),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: greyIconColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: onShare,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 3.0),
                        child: Icon(
                          Icons.share_outlined,
                          size: 24,
                          color: titleColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
