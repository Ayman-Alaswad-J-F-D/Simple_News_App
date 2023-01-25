import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class SportsScreen extends StatelessWidget {
  SportsScreen({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BreakingNewsAppCubit.get(context).sportList;
        return ScreenTypeLayout(
          mobile: Builder(
            builder: (BuildContext context) {
              BreakingNewsAppCubit.get(context).isDesktop == false
                  ? articlesBuilder(list, context)
                  : BreakingNewsAppCubit.get(context).setDesktop(false);
              return articlesBuilder(list, context);
            },
          ),
          desktop: Builder(
            builder: (BuildContext context) {
              BreakingNewsAppCubit.get(context).isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: articlesBuilder(list, context),
                        ),
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
                                    Container(
                                      height: 300,
                                      width: double.infinity,
                                      // color: Colors.'grey',
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        // ignore: unnecessary_null_comparison
                                        child: list[BreakingNewsAppCubit.get(
                                                            context)
                                                        .selectedItem]
                                                    ['urlToImage'] ==
                                                null
                                            ? Icon(
                                                Icons
                                                    .image_not_supported_rounded,
                                                size: 140)
                                            : Image.network(
                                                list[BreakingNewsAppCubit.get(
                                                            context)
                                                        .selectedItem]
                                                    ['urlToImage'],
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return const Icon(
                                                    Icons
                                                        .image_not_supported_rounded,
                                                    size: 150,
                                                    color: Colors.grey,
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      '${list[BreakingNewsAppCubit.get(context).selectedItem]['title']}',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      list[BreakingNewsAppCubit.get(context)
                                                      .selectedItem]
                                                  ['description'] ==
                                              null
                                          ? 'No Found Description'
                                          : '${list[BreakingNewsAppCubit.get(context).selectedItem]['description']}',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey.shade600),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${list[BreakingNewsAppCubit.get(context).selectedItem]['publishedAt']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  : BreakingNewsAppCubit.get(context).setDesktop(true);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: articlesBuilder(list, context),
                  ),
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
                              Container(
                                height: 300,
                                width: double.infinity,
                                // color: Colors.'grey',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // ignore: unnecessary_null_comparison
                                  child: list[BreakingNewsAppCubit.get(context)
                                              .selectedItem]['urlToImage'] ==
                                          null
                                      ? Icon(Icons.image_not_supported_rounded,
                                          size: 140)
                                      : Image.network(
                                          list[BreakingNewsAppCubit.get(context)
                                              .selectedItem]['urlToImage'],
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return const Icon(
                                              Icons.image_not_supported_rounded,
                                              size: 100,
                                              color: Colors.grey,
                                            );
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${list[BreakingNewsAppCubit.get(context).selectedItem]['title']}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                list[BreakingNewsAppCubit.get(context)
                                            .selectedItem]['description'] ==
                                        null
                                    ? 'No Found Description'
                                    : '${list[BreakingNewsAppCubit.get(context).selectedItem]['description']}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade600),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${list[BreakingNewsAppCubit.get(context).selectedItem]['publishedAt']}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          // var cubit = NewAppCubit.get(context);

          // return BlocConsumer<NewAppCubit, NewAppStates>(
          //   listener: (context, state) {
          //     if (state is NewAppGetSportsSuccessState) {
          //       isLoading = true;
          //     }
          //   },
          //   builder: (context, state) {
          //     return ScreenTypeLayout(
          //       mobile: isLoading && cubit.sportList.isNotEmpty
          //           ? Builder(
          //               builder: (BuildContext context) {
          //                 cubit.isDesktop == false
          //                     ? articlesBuilder(cubit.sportList, context)
          //                     : cubit.setDesktop(false);
          //                 return articlesBuilder(cubit.sportList, context);
          //               },
          //             )
          //           : myShimmerAndroid(context),
          //       desktop: isLoading && cubit.sportList.isNotEmpty
          //           ? Builder(
          //               builder: (BuildContext context) {
          //                 cubit.isDesktop
          //                     ? desktopItem(cubit.sportList, context)
          //                     : cubit.setDesktop(true);
          //                 return desktopItem(cubit.sportList, context);
          //               },
          //             )
          //           : myShimmerDesktop(cubit.sportList, context),

          //       breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
        );
      },
    );
  }
}
