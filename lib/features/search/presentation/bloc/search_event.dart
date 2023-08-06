part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchImageEvent extends SearchEvent {
  final String query;

  SearchImageEvent({
    this.query = '',
  });
}

class LoadMoreEvent extends SearchEvent {
  final String query;

  LoadMoreEvent( {
    this.query = '',
  });
}
