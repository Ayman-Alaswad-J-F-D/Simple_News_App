import 'package:flutter/material.dart';
// import 'package:new_app/layout/new_app.dart';
import 'package:new_app/shared/cubit/cubit.dart';

// import '../../modules/web_view.dart';

Widget buildArticalItme(article, context, index) {
  var imageUrl = '${article['urlToImage']}';
  return Container(
    color: NewAppCubit.get(context).page1SelectedItem == index &&
            NewAppCubit.get(context).isDesktop
        ? Theme.of(context).cardColor
        : null,
    child: InkWell(
      onTap: () {
        // navigateTo(context, WebViewScreen(article['url']));
        NewAppCubit.get(context).selectItemPage1Item(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 130.0,
              width: 130.0,
              // color: Colors.grey,
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
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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

//////////////////

Widget myDivider() => const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Divider(),
    );

//////////////////////////

Widget articlesBuilder(List list, context, {isSearch = false}) =>
    list.isNotEmpty
        ? ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticalItme(list[index], context, index),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          )
        : isSearch
            ? const Icon(
                Icons.search_rounded,
                size: 150,
                color: Colors.grey,
              )
            : const Center(child: CircularProgressIndicator());

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

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
