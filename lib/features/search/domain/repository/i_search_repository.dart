import '../../data/model/search_model.dart';

abstract class ISearchRepository {
  Future<(SearchModel,int)> searchImage(String query, int page);
}
