import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/shared/components/custom_cache_network_image.dart';

import '../../modules/web_view.dart';
import '../cubit/cubit.dart';
import '../extension/extension_navigation.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({
    Key? key,
    required this.index,
    required this.article,
  }) : super(key: key);

  final int index;
  final Map<String, dynamic> article;

  @override
  Widget build(BuildContext context) {
    var imageUrl = '${article['urlToImage']}';
    var cubit = BreakingNewsAppCubit.get(context);
    return Container(
      color: cubit.selectedItem == index && cubit.isDesktop
          ? Theme.of(context).cardColor
          : null,
      child: InkWell(
        onTap: () {
          if (cubit.isDesktop == true)
            cubit.selectItemBuilder(index);
          else
            context.toScreen(screen: WebViewScreen(article['url']));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ImageWidget(imageUrl: imageUrl),
              const SizedBox(width: 20.0),
              TitleAndPublishWidget(article: article),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: 130.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        clipBehavior: Clip.antiAlias,
        // ignore: unnecessary_null_comparison
        child: CustomCachedNetworkImage(
          imageUrl: imageUrl,
          fitImage: BoxFit.cover,
          memCacheHeight: 150,
          memCacheWidth: 150,
          horizontal: 25,
          vertical: 25,
          sizeIcon: 100,
          icon: Icons.image_not_supported_rounded,
        ),
      ),
    );
  }
}

class TitleAndPublishWidget extends StatelessWidget {
  const TitleAndPublishWidget({Key? key, required this.article})
      : super(key: key);

  final Map<String, dynamic> article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '${article['title']}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Row(
              children: [
                Text(
                  'Published At: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                ),
                Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse(article['publishedAt'])),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
