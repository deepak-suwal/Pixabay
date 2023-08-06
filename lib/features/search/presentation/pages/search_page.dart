import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_assignment/core/injection/injection.dart';
import 'package:flutter_assignment/core/routes/app_router.gr.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/core/util/keyboard_util.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/core/widgets/searching_widget.dart';
import 'package:flutter_assignment/features/favourite/presentation/bloc/favourite_cubit.dart';
import 'package:flutter_assignment/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter_assignment/features/search/presentation/widget/image_widget.dart';
import 'package:flutter_assignment/features/search/presentation/widget/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/widgets/no_data_widget.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  final FavoriteCubit favoriteCubit;
  final SearchBloc searchBloc;
  bool isLoading = false;
  bool hasReachedEnd = false;

  final ScrollController scrollController = ScrollController();

  _SearchPageState()
      : favoriteCubit = getIt<FavoriteCubit>(),
        searchBloc = getIt<SearchBloc>();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          (searchBloc.total > searchBloc.page * pageSize)) {
        searchBloc.isLoadingMore = true;
        searchBloc.page++;
        searchBloc.add(LoadMoreEvent(query: searchController.text.trim()));
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: appName,
      actions: [
        IconButton(
          onPressed: () {
            context.router.push(
              FavouriteRoute(favoriteCubit: favoriteCubit),
            );
          },
          icon: const Icon(Icons.favorite_border),
        )
      ],
      body: BlocProvider(
        create: (context) => searchBloc,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchWidget(
                searchController: searchController,
                onClosePressed: () {
                  hideKeyboard();
                  if (searchController.text.isNotEmpty) {
                    searchController.text = '';
                    searchBloc.page = 1;
                    searchBloc.add(SearchImageEvent());
                  }
                },
                onSearchPressed: () {
                  hideKeyboard();
                  searchBloc.page = 1;
                  searchBloc.add(
                      SearchImageEvent(query: searchController.text.trim()));
                },
              ),
              8.verticalSpace(),
              BlocBuilder<SearchBloc, SearchState>(
                bloc: searchBloc..add(SearchImageEvent()),
                builder: (context, state) {
                  return switch (state) {
                    SearchImageLoadingState() => const SearchingWidget(),
                    SearchImageLoadedState() =>
                      BlocBuilder<FavoriteCubit, List<String>>(
                        bloc: favoriteCubit..loadFavorites(),
                        builder: (context, favouriteState) {
                          final imageList = state.list;
                          return imageList.isNotEmpty
                              ? Stack(
                                  children: [
                                    GridView.builder(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      itemCount: imageList.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: 180,
                                      ),
                                      itemBuilder: (ctx, index) {
                                        final imageModel = imageList[index];
                                        return ImageWidget(
                                          favoriteCubit: favoriteCubit,
                                          isFavourite: favouriteState
                                              .contains(jsonEncode(imageModel)),
                                          imageModel: imageModel,
                                        );
                                      },
                                    ),
                                    searchBloc.isLoadingMore
                                        ? Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child:
                                                const CircularProgressIndicator()
                                                    .center(),
                                          )
                                        : const SizedBox()
                                  ],
                                ).expanded()
                              : const NoDataWidget();
                        },
                      ),
                    SearchImageFailureState() => const NoDataWidget(),
                  };
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
