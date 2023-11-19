import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../../logic/cubit/cubit.dart';
import '../../logic/models/news_model.dart';
import '../styles/colors.dart';
import 'build_articales.dart';
import 'custom_cache_network_image.dart';

class DesktopBuilder extends StatelessWidget {
  const DesktopBuilder({Key? key, required this.atricles}) : super(key: key);

  final List<ArticlesModel> atricles;

  @override
  Widget build(BuildContext context) {
    var cubit = BreakingNewsAppCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ArticlesBuilder(articles: atricles),
        ),
        if (atricles.length > 0)
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
                      imageUrl: atricles[cubit.selectedItem].urlToImage ?? '',
                    ),
                    const SizedBox(height: 20),
                    TitleWidget(
                      title: atricles[cubit.selectedItem].title ?? '',
                    ),
                    const SizedBox(height: 10),
                    DescriptionWidget(
                      description:
                          atricles[cubit.selectedItem].description ?? '',
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PublishedAtWidget(
                          publishAt:
                              atricles[cubit.selectedItem].publishedAt ?? '',
                        ),
                        LinkWidget(url: atricles[cubit.selectedItem].url ?? '')
                      ],
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
            desktop: true,
            imageUrl: imageUrl,
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
      description.isEmpty ? S.of(context).NoFoundDescription : description,
      maxLines: 5,
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
    return Text(
      DateFormat.yMMMMEEEEd().format(DateTime.parse(publishAt)),
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

class LinkWidget extends StatelessWidget {
  const LinkWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("News Link", style: Theme.of(context).textTheme.caption),
        IconButton(
          icon: Icon(Icons.link, color: Theme.of(context).iconTheme.color),
          onPressed: () => launchUrl(Uri.parse(url)),
        )
      ],
    );
  }
}
