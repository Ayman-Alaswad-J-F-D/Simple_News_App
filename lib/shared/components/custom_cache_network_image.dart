import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.sizeIcon,
    required this.icon,
    required this.fitImage,
    this.memCacheWidth,
    this.memCacheHeight,
    this.desktop = false,
  }) : super(key: key);

  final String imageUrl;
  final double sizeIcon;
  final IconData icon;
  final BoxFit fitImage;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final bool desktop;

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
        color: Theme.of(context).dividerColor,
        size: sizeIcon,
      ),
      imageBuilder: (_, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.fill,
        errorBuilder: (context, object, stackTrace) => SizedBox(),
      ),
      progressIndicatorBuilder: (context, url, download) => !desktop
          ? Center(
              child: CircularProgressIndicator(
                value: download.progress,
                color: Theme.of(context).dividerColor,
              ),
            )
          : Shimmer.fromColors(
              baseColor: AppColors.greyS200,
              highlightColor: AppColors.white,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
    );
  }
}
