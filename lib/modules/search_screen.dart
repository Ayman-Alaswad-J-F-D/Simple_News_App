// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/generated/l10n.dart';
import 'package:new_app/shared/extension/extension_navigation.dart';

import '../logic/cubit/cubit.dart';
import '../logic/cubit/states.dart';
import '../shared/components/build_articales.dart';
import '../shared/components/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () => context.back(context),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          bottom: 10,
                          top: 15,
                          end: 20,
                        ),
                        child: BlocBuilder<BreakingNewsAppCubit,
                            BreakingNewsAppStates>(
                          builder: (context, state) {
                            final cubit = BreakingNewsAppCubit.get(context);
                            return CustomTextFormField(
                              label: S.of(context).Search,
                              typeInput: TextInputType.text,
                              suffixIcon: Icons.search_rounded,
                              onChange: (value) =>
                                  cubit.searchFromLists(value: value),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BreakingNewsAppCubit, BreakingNewsAppStates>(
                builder: (context, state) => ArticlesBuilder(
                  articles: BreakingNewsAppCubit.get(context).searchList,
                  isSearch: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
