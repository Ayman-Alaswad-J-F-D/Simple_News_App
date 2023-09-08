import 'package:flutter/material.dart';

import '../../modules/web_view.dart';
import '../cubit/cubit.dart';
import '../styles/colors.dart';
import 'components.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({
    Key? key,
    required this.index,
    required this.article,
  }) : super(key: key);

  final int index;
  final Map article;

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
            navigateTo(context, WebViewScreen(article['url']));
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

class TitleAndPublishWidget extends StatelessWidget {
  const TitleAndPublishWidget({Key? key, required this.article})
      : super(key: key);

  final Map article;

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
            Text(
              'published At : ${article['publishedAt']}',
              // DateFormat.yMMMd().format()
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
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
        // ignore: unnecessary_null_comparison
        child: imageUrl == null
            ? Icon(Icons.image_not_supported_rounded, size: 80)
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.image_not_supported_rounded,
                    color: AppColors.grey,
                    size: 100,
                  );
                },
              ),
      ),
    );
  }
}
