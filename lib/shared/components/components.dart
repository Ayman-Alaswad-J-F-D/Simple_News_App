import 'package:flutter/material.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../modules/web_view.dart';

Widget buildArticalItme(article, context, index) {
  var imageUrl = '${article['urlToImage']}';
  return Container(
    color: NewAppCubit.get(context).selectedItem == index &&
            NewAppCubit.get(context).isDesktop
        ? Theme.of(context).cardColor
        : null,
    child: InkWell(
      onTap: () {
        if (NewAppCubit.get(context).isDesktop == true) {
          NewAppCubit.get(context).selectItemBuilder(index);
        } else {
          navigateTo(context, WebViewScreen(article['url']));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 130.0,
              width: 130.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                // ignore: unnecessary_null_comparison
                child: imageUrl == null
                    ? Icon(Icons.image_not_supported_rounded, size: 80)
                    : Image.network(
                        imageUrl,
                        errorBuilder: (BuildContext context, Object exception,
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
            const SizedBox(width: 20.0),
            Expanded(
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
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/////////////////////////////

Widget articlesBuilder(List list, context, {isSearch = false}) =>
    list.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () async {
              NewAppCubit.get(context).getGeneralData();
              NewAppCubit.get(context).getSportsData();
              NewAppCubit.get(context).getTechnologyData();
            },
            child: ListView.separated(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticalItme(list[index], context, index),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: list.length,
            ),
          )
        : isSearch
            ? const Icon(Icons.search_rounded, size: 150, color: Colors.grey)
            : const Center(child: CircularProgressIndicator());

/////////////////////////////

Widget desktopItem(list, context) => Row(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: list[NewAppCubit.get(context).selectedItem]
                                    ['urlToImage'] ==
                                null
                            ? Icon(Icons.image_not_supported_rounded, size: 140)
                            : Image.network(
                                list[NewAppCubit.get(context).selectedItem]
                                    ['urlToImage'],
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
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
                      '${list[NewAppCubit.get(context).selectedItem]['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      list[NewAppCubit.get(context).selectedItem]
                                  ['description'] ==
                              null
                          ? 'No Found Description'
                          : '${list[NewAppCubit.get(context).selectedItem]['description']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 17, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${list[NewAppCubit.get(context).selectedItem]['publishedAt']}',
                          style: Theme.of(context).textTheme.bodyText2,
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

/////////////////////////////

Widget myShimmerAndroid(context) => RefreshIndicator(
      onRefresh: () async {
        NewAppCubit.get(context).getGeneralData();
        NewAppCubit.get(context).getSportsData();
        NewAppCubit.get(context).getTechnologyData();
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: myContainer(130, 130),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myContainer(150, 15),
                    SizedBox(height: 10),
                    myContainer(165, 20),
                    SizedBox(height: 10),
                    myContainer(165, 20),
                    SizedBox(height: 10),
                    myContainer(100, 15),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(),
        ),
      ),
    );

/////////////////////////////

Widget myShimmerDesktop(list, context) => Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white.withOpacity(0.8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: myContainer(200, 200),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myContainer(450, 25),
                        SizedBox(height: 10),
                        myContainer(400, 30),
                        SizedBox(height: 10),
                        myContainer(400, 30),
                        SizedBox(height: 10),
                        myContainer(200, 25),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(),
            ),
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myContainer(670, 300),
                  SizedBox(height: 30),
                  myContainer(630, 40),
                  SizedBox(height: 10),
                  myContainer(550, 55),
                  SizedBox(height: 25),
                  myContainer(250, 30)
                ],
              ),
            ),
          ),
        ),
      ],
    );

/////////////////////////////

Widget myContainer(double? width, double? height) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: width,
      height: height,
    );

/////////////////////////////

Widget myTextFormField({
  required TextEditingController textEditingController,
  required TextInputType typeInput,
  required String label,
  double radius = 15.0,
  double gapPadding = 5.0,
  Icon? prefixIcon,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function()? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  String? Function(String?)? validate,
  bool isPassword = false,
  bool filledneed = false,
  Color fillColor = Colors.white,
  String? hintText,
  Color? colorHintText,
  double? fintSizeHintText,
}) =>
    TextFormField(
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      controller: textEditingController,
      keyboardType: typeInput,
      obscureText: isPassword,
      // style: const TextStyle(color: Colors.indigo),
      decoration: InputDecoration(
        filled: filledneed,
        fillColor: filledneed ? fillColor : Colors.white,
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Tajawal',
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorHintText,
          fontSize: fintSizeHintText,
        ),
        border: OutlineInputBorder(
          gapPadding: gapPadding,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              )
            : null,
      ),
    );

Widget myDivider() => const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Divider(),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
