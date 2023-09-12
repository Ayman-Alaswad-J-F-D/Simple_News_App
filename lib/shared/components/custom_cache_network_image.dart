import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.horizontal,
    required this.vertical,
    required this.sizeIcon,
    required this.icon,
    required this.fitImage,
    this.memCacheWidth,
    this.memCacheHeight,
  }) : super(key: key);

  final String imageUrl;
  final double horizontal;
  final double vertical;
  final double sizeIcon;
  final IconData icon;
  final BoxFit fitImage;
  final int? memCacheWidth;
  final int? memCacheHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fitImage,
      filterQuality: FilterQuality.high,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      //! Note: if use placeholder you need remove progressIndicatorBuilder
      //! (just use placeholder or just use progressIndicatorBuilder)
      // placeholder: (context,url) => Widget,
      errorWidget: (context, url, error) => Icon(
        icon,
        color: AppColors.grey,
        size: sizeIcon,
      ),
      progressIndicatorBuilder: (context, url, download) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: CircularProgressIndicator(
          value: download.progress,
          color: AppColors.primaryColorS300,
        ),
      ),
    );
  }
}
