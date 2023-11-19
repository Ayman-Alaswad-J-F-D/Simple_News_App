import 'package:flutter/material.dart';
import 'package:new_app/shared/constants.dart';

import '../../logic/cubit/cubit.dart';
import '../../logic/models/news_model.dart';
import '../styles/colors.dart';
import 'build_article_item.dart';
import 'shimmer_mobile.dart';

class ArticlesBuilder extends StatelessWidget {
  const ArticlesBuilder({
    Key? key,
    required this.articles,
    this.isSearch = false,
  }) : super(key: key);

  final List<ArticlesModel> articles;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    final cubit = BreakingNewsAppCubit.get(context);
    if (articles.isNotEmpty)
      return RefreshIndicator(
        onRefresh: () async => cubit.fetchAllData(
          country: cubit.appLanguage == AR ? EG_COUNTRY : US_COUNTRY,
        ),
        child: ListView.separated(
          itemCount: articles.length,
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              BuildArticleItem(article: articles[index], index: index),
          separatorBuilder: (context, index) =>
              Divider(indent: 20, thickness: 0.3),
        ),
      );
    else
      return isSearch
          ? const Icon(Icons.search_rounded, size: 120, color: AppColors.grey)
          : ShimmerMobile();
  }
}
