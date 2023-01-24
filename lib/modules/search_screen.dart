// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BreakingNewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: myTextFormField(
                    textEditingController: searchController,
                    typeInput: TextInputType.text,
                    label: 'Search',
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                    onChange: (value) {
                      BreakingNewsAppCubit.get(context).getSearch(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    }),
              ),
              Expanded(child: articlesBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
