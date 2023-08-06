part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final List list;

  const SearchState(this.list);
}

class SearchImageLoadingState extends SearchState {
  const SearchImageLoadingState(super.list);
}

class SearchImageLoadedState extends SearchState {
  final List<ImageModel> imageList;

  const SearchImageLoadedState(this.imageList) : super(imageList);
}

class SearchImageFailureState extends SearchState {
  final String error;

  const SearchImageFailureState(this.error, super.list);
}
