import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_text_styles.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String releaseYear;

  const MovieItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.releaseYear,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: AppTextStyles.highlightedText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "( ${releaseYear.split('-')[0]} )",
                    style: AppTextStyles.highlightedText1,
                  ),
                ],
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500$imageUrl",
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
              const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.only(top: 4.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// width: double.infinity,
// child: Text(
// title,
// style: const TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w600,
// fontSize: 14,
// ),
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Text(
// releaseYear,
// style: const TextStyle(
// color: Color(0xFF9E9E9E),
// fontSize: 12,
// ),
// ),
// ],
// ),
// ),