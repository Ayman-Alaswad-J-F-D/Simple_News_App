// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/articles_builder.dart';
import '../shared/components/custom_text_form_field.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsAppCubit, BreakingNewsAppStates>(
      builder: (context, state) {
        var list = BreakingNewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(elevation: 0.0),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextFormField(
                  label: 'Search',
                  typeInput: TextInputType.text,
                  textEditingController: searchController,
                  prefixIcon: const Icon(Icons.search_rounded),
                  onChange: (value) =>
                      BreakingNewsAppCubit.get(context).getSearch(value),
                  validate: (value) {
                    if (value!.isEmpty) return 'search must not be empty';
                    return null;
                  },
                ),
              ),
              Expanded(child: ArticlesBuilder(list: list, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
