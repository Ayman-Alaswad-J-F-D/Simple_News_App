import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/generated/l10n.dart';
import 'package:new_app/shared/components/custom_cache_network_image.dart';
import 'package:new_app/shared/utils/responsive.dart';
import '../../logic/cubit/cubit.dart';
import '../../logic/models/news_model.dart';
import '../../modules/web_view.dart';
import '../extension/extension_navigation.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({
    Key? key,
    required this.index,
    required this.article,
  }) : super(key: key);

  final int index;
  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    final imageUrl = '${article.urlToImage}';
    final cubit = BreakingNewsAppCubit.get(context);
    return Container(
      height: _flexableHiegth(context),
      color: cubit.selectedItem == index && Responsive.isDesktop(context)
          ? Theme.of(context).cardColor
          : null,
      child: InkWell(
        onTap: () {
          if (Responsive.isDesktop(context))
            cubit.selectItemBuilder(index);
          else
            context.toScreen(screen: WebViewScreen(article.url ?? ''));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ImageWidget(imageUrl: imageUrl),
              const SizedBox(width: 18.0),
              ArticleInfo(article: article),
            ],
          ),
        ),
      ),
    );
  }

  double _flexableHiegth(context) {
    if (Responsive.isDesktop(context)) {
      //* >= 1024
      return MediaQuery.of(context).size.height / 3;
    } else if (Responsive.isTablet(context)) {
      //* >= 801 && <= 1024
      return MediaQuery.of(context).size.height / 4;
    } else if (Responsive.isMobileLarge(context)) {
      //* >= 501 && <= 800
      return MediaQuery.of(context).size.height / 4.4;
    } else {
      //* <= 500
      return MediaQuery.of(context).size.height / 4.8;
    }
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: CustomCachedNetworkImage(
            imageUrl: imageUrl,
            fitImage: BoxFit.cover,
            memCacheHeight: 150,
            memCacheWidth: 150,
            sizeIcon: 90,
            icon: Icons.image_not_supported_rounded,
          ),
        ),
      ),
    );
  }
}

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({Key? key, required this.article}) : super(key: key);

  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${article.title}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  S.of(context).PublishedAt + ' : ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse('${article.publishedAt}')),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
