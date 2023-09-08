import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../styles/colors.dart';
import 'articles_builder.dart';

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
                    CustomImage(list: list, cubit: cubit),
                    const SizedBox(height: 20),
                    TitleWidget(list: list, cubit: cubit),
                    const SizedBox(height: 10),
                    DescriptionWidget(list: list, cubit: cubit),
                    const SizedBox(height: 15),
                    PublishedAtWidget(list: list, cubit: cubit),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PublishedAtWidget extends StatelessWidget {
  const PublishedAtWidget({
    Key? key,
    required this.list,
    required this.cubit,
  }) : super(key: key);

  final List list;
  final BreakingNewsAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${list[cubit.selectedItem]['publishedAt']}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.list,
    required this.cubit,
  }) : super(key: key);

  final List list;
  final BreakingNewsAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Text(
      list[cubit.selectedItem]['description'] == null
          ? 'No Found Description'
          : '${list[cubit.selectedItem]['description']}',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 17, color: AppColors.greyS600),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.list,
    required this.cubit,
  }) : super(key: key);

  final List list;
  final BreakingNewsAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${list[cubit.selectedItem]['title']}',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 24, color: AppColors.black),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.list,
    required this.cubit,
  }) : super(key: key);

  final List list;
  final BreakingNewsAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: list[cubit.selectedItem]['urlToImage'] == null
            ? Icon(Icons.image_not_supported_rounded, size: 140)
            : Image.network(
                list[cubit.selectedItem]['urlToImage'],
                fit: BoxFit.cover,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) =>
                    const Icon(
                  Icons.image_not_supported_rounded,
                  color: AppColors.grey,
                  size: 100,
                ),
              ),
      ),
    );
  }
}
