import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../styles/colors.dart';
import 'articles_builder.dart';
import 'custom_cache_network_image.dart';

class DesktopItems extends StatelessWidget {
  const DesktopItems({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    var cubit = BreakingNewsAppCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ArticlesBuilder(list: list)),
        if (list.length > 0)
          Expanded(
            child: Container(
              color: Theme.of(context).cardColor,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImage(
                      imageUrl: list[cubit.selectedItem]['urlToImage'],
                    ),
                    const SizedBox(height: 20),
                    TitleWidget(
                      title: list[cubit.selectedItem]['title'],
                    ),
                    const SizedBox(height: 10),
                    DescriptionWidget(
                      description: list[cubit.selectedItem]['description'],
                    ),
                    const SizedBox(height: 15),
                    PublishedAtWidget(
                      publishAt: list[cubit.selectedItem]['publishedAt'],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 400,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: CustomCachedNetworkImage(
            imageUrl: imageUrl,
            horizontal: 300,
            vertical: 180,
            fitImage: BoxFit.fill,
            icon: Icons.error,
            sizeIcon: 150,
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      // ignore: unnecessary_null_comparison
      description == null ? 'No Found Description' : description,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 17, color: AppColors.greyS600),
    );
  }
}

class PublishedAtWidget extends StatelessWidget {
  const PublishedAtWidget({
    Key? key,
    required this.publishAt,
  }) : super(key: key);

  final String publishAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          publishAt,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
