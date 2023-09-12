import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../styles/colors.dart';
import 'build_article_item.dart';
import 'components.dart';

class ArticlesBuilder extends StatelessWidget {
  const ArticlesBuilder({
    Key? key,
    required this.list,
    this.isSearch = false,
  }) : super(key: key);

  final List list;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    var cubit = BreakingNewsAppCubit.get(context);
    return list.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () async {
              cubit.getGeneralData();
              cubit.getSportsData();
              cubit.getTechnologyData();
            },
            child: ListView.separated(
              itemCount: list.length,
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  BuildArticleItem(article: list[index], index: index),
              separatorBuilder: (context, index) => myDivider(),
            ),
          )
        : isSearch
            ? const Icon(Icons.search_rounded, size: 150, color: AppColors.grey)
            : const Center(child: CircularProgressIndicator());
  }
}
