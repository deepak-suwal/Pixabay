import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/search/domain/controller/i_search_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/search_model.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ISearchController controller;
  List<ImageModel> paginatedDate = [];
  int page = 1;
  int total = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  bool hasMore = true;

  SearchBloc(this.controller) : super(const SearchImageLoadingState([])) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchImageEvent) {
        scrollController.addListener(() {});
        emit(const SearchImageLoadingState([]));
        final response = await controller.searchImage(event.query, page);
        if (response.$2 == 200) {
          total = response.$1.total!;
          emit(SearchImageLoadedState(response.$1.hits ?? []));
          return;
        }
        emit(const SearchImageFailureState('Error occurred', []));
      } else if (event is LoadMoreEvent) {
        final response = await controller.searchImage(event.query, page);
        if (response.$2 == 200) {
          isLoadingMore = false;
          total = response.$1.total!;
          emit(SearchImageLoadedState(
            [...state.list, ...response.$1.hits!],
          ));
          return;
        }
        emit(const SearchImageFailureState('Error occurred', []));
      }
    });
  }
}
